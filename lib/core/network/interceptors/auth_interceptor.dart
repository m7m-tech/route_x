// lib/core/network/interceptors/auth_interceptor.dart
import 'package:dio/dio.dart';

import 'package:route_x/core/constants/api_endpoints.dart';
import 'package:route_x/core/storage/secure_storage_service.dart';

/// Attaches `Authorization: Bearer <accessToken>` to every outgoing request
/// except the public auth endpoints (register, OTP verify, login, google,
/// forgot/reset password and the refresh call itself).
class AuthInterceptor extends Interceptor {
  AuthInterceptor({required this.storage});

  final SecureStorageService storage;

  /// Endpoints that never require the access token.
  static const List<String> _publicPaths = [
    ApiEndpoints.register,
    ApiEndpoints.verifyOtp,
    ApiEndpoints.login,
    ApiEndpoints.googleAuth,
    ApiEndpoints.forgotPassword,
    ApiEndpoints.resetPassword,
    ApiEndpoints.refreshToken,
  ];

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (!_publicPaths.contains(options.path)) {
      final accessToken = await storage.readAccessToken();
      if (accessToken != null && accessToken.isNotEmpty) {
        options.headers['Authorization'] = 'Bearer $accessToken';
      }
    }
    handler.next(options);
  }
}
