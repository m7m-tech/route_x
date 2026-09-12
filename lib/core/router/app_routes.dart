import 'package:flutter/material.dart';
import 'package:route_x/core/theme/app_colors.dart';
import 'package:route_x/core/theme/app_text_styles.dart';
import 'package:route_x/features/auth/presentation/screens/driver_login_screen.dart';
// import 'package:route_x/features/auth/presentation/screens/forget_password_screen.dart';
// import 'package:route_x/features/auth/presentation/screens/signup_step1_screen.dart';
// import 'package:route_x/features/auth/presentation/screens/verify_code_screen.dart';

/// Central routing table for the entire RouteX application.
///
/// Every named route in the app is registered here. Screens are imported
/// and mapped; **no business logic** lives in this file.
class AppRoutes {
  AppRoutes._(); // prevent instantiation

  // ── Initial Route ─────────────────────────────────────────────────────────

  /// The route shown when the app first launches.
  static const String initialRoute = splashScreen;

  // ── Route Constants ───────────────────────────────────────────────────────

  /// Animated brand splash shown on cold start.
  static const String splashScreen = '/splash_screen';

  /// Feature walk-through carousel displayed on first launch.
  static const String onboardingScreen = '/onboarding_screen';

  // ── Auth – Signup Flow ────────────────────────────────────────────────────

  /// Step 1: name, email and phone number.
  static const String signupStep1Screen = '/signup_step1_screen';

  /// Step 2: vehicle selection and plate number.
  static const String signupStep2Screen = '/signup_step2_screen';

  /// Step 3: password creation.
  static const String signupStep3Screen = '/signup_step3_screen';

  /// Final review screen before submitting registration.
  static const String signupSummaryScreen = '/signup_summary_screen';

  /// OTP email verification screen.
  static const String otpVerificationScreen = '/otp_verification_screen';

  /// Success screen shown after registration is complete.
  static const String youreAllSetScreen = '/youre_all_set_screen';

  // ── Auth – Login & Password Recovery ───────────────────────────────────────

  /// Email/phone + password login screen.
  static const String driverLoginScreen = '/driver_login_screen';

  /// Forgot-password: email input screen.
  static const String forgetPasswordScreen = '/forget_password_screen';

  /// Forgot-password: OTP verification screen.
  static const String forgetPasswordOtpScreen = '/forget_password_otp_screen';

  /// Forgot-password: new password entry screen.
  static const String setNewPasswordScreen = '/set_new_password_screen';

  // ── Orders ────────────────────────────────────────────────────────────────

  /// Create-order form screen.
  static const String createOrderScreen = '/create_order_screen';

  // ── Router ────────────────────────────────────────────────────────────────

  /// Route name → screen builder.
  ///
  /// Screens that are not implemented yet resolve to a lightweight
  /// placeholder, so navigation can never land on a blank page.
  static final Map<String, WidgetBuilder> routes = {
    // driverLoginScreen: (_) => const DriverLoginScreen(),
    
    // otpVerificationScreen: (_) => const VerifyCodeScreen(),
    
    // forgetPasswordScreen: (_) => const ForgetPasswordScreen(),
    // forgetPasswordOtpScreen: (_) => const VerifyCodeScreen(),
    
  };

  /// Wire this into `MaterialApp.onGenerateRoute`.
  ///
  /// Resolves every registered [AppRoutes] constant to its screen; any
  /// unrecognised name falls back to a placeholder instead of a blank page.
  
}

/// Fallback shown for routes whose screen is not implemented yet.
