// lib/core/constants/api_endpoints.dart

/// Central registry for every backend endpoint the app talks to.
///
/// The base URL is configurable at build/run time via `--dart-define` so it
/// never needs to be hardcoded in more than one place:
///
/// ```sh
/// flutter run --dart-define=API_BASE_URL=https://staging.example.com
/// ```
class ApiEndpoints {
  ApiEndpoints._(); // prevent instantiation

  /// Render.com-hosted gateway. The instance may spin down when idle, so the
  /// first request after inactivity can take 30–50s (see DioClient timeouts).
  static const String baseUrl = String.fromEnvironment(
    'API_BASE_URL',
    defaultValue: 'https://backend-gateway-wdzv.onrender.com',
  );

  // ── Auth ──────────────────────────────────────────────────────────────────

  /// POST — create a new driver account.
  static const String register = '/auth/register';

  /// POST — verify the email OTP after registration.
  static const String verifyOtp = '/auth/verify-otp';

  /// POST — email + password login.
  static const String login = '/auth/login';

  /// POST — Google OAuth login / signup.
  static const String googleAuth = '/auth/google';

  /// POST — request a password-reset OTP.
  static const String forgotPassword = '/auth/forgot-password';

  /// POST — submit new password with the reset token.
  static const String resetPassword = '/auth/reset-password';

  /// POST — exchange a refresh token for a new access/refresh pair.
  static const String refreshToken = '/auth/refresh';

  // ── Orders ──────────────────────────────────────────────────────────────

  /// POST / GET — create or list delivery orders.
  static const String orders = '/orders';
}
