// lib/core/network/dio_client.dart
import 'package:dio/dio.dart';

import 'package:route_x/core/constants/api_endpoints.dart';
import 'package:route_x/core/network/auth_status_controller.dart';
import 'package:route_x/core/network/interceptors/auth_interceptor.dart';
import 'package:route_x/core/network/interceptors/refresh_interceptor.dart';
import 'package:route_x/core/storage/secure_storage_service.dart';

/// Constructs the app's `Dio` graph.
///
/// Two instances are produced:
///  - a **client** carrying the auth + refresh interceptors (used by data
///    sources), and
///  - a **bare refresh client** used *only* by [RefreshInterceptor] so the
///    refresh call never re-enters the interceptor chain.
///
/// Timeouts are deliberately generous: the Render.com instance can take
/// 30–50s to wake from idle, so the first call must not be killed early.
/// UI layers surface this as a "connecting…" state.
class DioClient {
  DioClient._(); // prevent instantiation

  static BaseOptions _baseOptions() => BaseOptions(
    baseUrl: ApiEndpoints.baseUrl,
    connectTimeout: const Duration(seconds: 60),
    receiveTimeout: const Duration(seconds: 90),
    contentType: Headers.jsonContentType,
    responseType: ResponseType.json,
  );

  /// App-wide HTTP client with the full interceptor chain.
  static Dio createClient({
    required SecureStorageService storage,
    required AuthStatusController authStatus,
  }) {
    final dio = Dio(_baseOptions());
    dio.interceptors.add(AuthInterceptor(storage: storage));
    dio.interceptors.add(
      RefreshInterceptor(
        storage: storage,
        authStatus: authStatus,
        dio: createRefreshClient(),
      ),
    );
    // NOTE: no LogInterceptor here on purpose — tokens/passwords must never
    // be written to logs, even in debug.
    return dio;
  }

  /// Interceptor-free client reserved for `/auth/refresh`.
  static Dio createRefreshClient() => Dio(_baseOptions());
}
