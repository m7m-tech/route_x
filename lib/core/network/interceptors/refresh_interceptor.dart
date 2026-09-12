// lib/core/network/interceptors/refresh_interceptor.dart
import 'package:dio/dio.dart';

import 'package:route_x/core/constants/api_endpoints.dart';
import 'package:route_x/core/network/auth_status_controller.dart';
import 'package:route_x/core/storage/secure_storage_service.dart';

/// Transparently recovers from a 401 by refreshing the access token.
///
/// Behaviour:
///  - On a 401 (not from the refresh endpoint itself): exchange the stored
///    refresh token for a new pair, persist it, and retry the original request
///    once with the fresh token (marked so a second 401 is treated as a real
///    logout rather than looping forever).
///  - While a refresh is already in flight, concurrent 401s share the same
///    refresh future (single-flight) and retry afterwards.
///  - If there is no refresh token, or the refresh call itself fails, the
///    session is cleared and [AuthStatusController.forceLogout] fires so the
///    app root routes to Login.
class RefreshInterceptor extends Interceptor {
  RefreshInterceptor({
    required this.storage,
    required this.authStatus,
    required Dio dio,
  }) : _refreshDio = dio;

  final SecureStorageService storage;
  final AuthStatusController authStatus;

  /// Dedicated client (no interceptors) used for the refresh call itself, so a
  /// failing refresh can never re-enter this interceptor.
  final Dio _refreshDio;

  Future<String?>? _refreshing;

  static const String _retriedExtraKey = 'refresh_interceptor_retried';

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    final request = err.requestOptions;
    final statusCode = err.response?.statusCode;

    if (statusCode != 401 || request.path.endsWith(ApiEndpoints.refreshToken)) {
      handler.next(err);
      return;
    }

    // This request already survived one refresh+retry round — a second 401
    // means the access is genuinely revoked, so end the session.
    if (request.extra[_retriedExtraKey] == true) {
      await _forceLogout();
      handler.reject(err);
      return;
    }

    final refreshToken = await storage.readRefreshToken();
    if (refreshToken == null || refreshToken.isEmpty) {
      await _forceLogout();
      handler.reject(err);
      return;
    }

    // Single-flight: concurrent 401s wait for the same refresh future.
    final refreshing = _refreshing ??= _performRefresh(refreshToken);

    try {
      final newAccessToken = await refreshing;
      if (newAccessToken == null || newAccessToken.isEmpty) {
        await _forceLogout();
        handler.reject(err);
        return;
      }

      final newOptions = request.copyWith(
        headers: {
          ...request.headers,
          'Authorization': 'Bearer $newAccessToken',
        },
        extra: {...request.extra, _retriedExtraKey: true},
      );
      final response = await _refreshDio.fetch(newOptions);
      handler.resolve(response);
    } catch (_) {
      // Refresh (or its retry) failed — session is over.
      await _forceLogout();
      handler.reject(err);
    } finally {
      _refreshing = null;
    }
  }

  /// Exchanges the refresh token for a fresh pair. Throws on any failure so the
  /// caller can trigger the logout path.
  Future<String?> _performRefresh(String refreshToken) async {
    final response = await _refreshDio.post<Map<String, dynamic>>(
      ApiEndpoints.refreshToken,
      data: {'refreshToken': refreshToken},
    );

    final data = response.data;
    if (data == null) {
      throw DioException(
        requestOptions: RequestOptions(path: ApiEndpoints.refreshToken),
        message: 'Empty refresh response',
      );
    }

    final newAccessToken = data['accessToken'] as String?;
    if (newAccessToken == null || newAccessToken.isEmpty) {
      throw DioException(
        requestOptions: RequestOptions(path: ApiEndpoints.refreshToken),
        message: 'Refresh response missing accessToken',
      );
    }

    // Backend may rotate the refresh token; when it does, persist it too.
    final newRefreshToken = data['refreshToken'] as String? ?? refreshToken;
    await storage.writeTokens(
      accessToken: newAccessToken,
      refreshToken: newRefreshToken,
    );
    return newAccessToken;
  }

  Future<void> _forceLogout() async {
    await storage.clear();
    authStatus.forceLogout();
  }
}
