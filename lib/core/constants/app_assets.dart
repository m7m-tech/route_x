/// Central registry for all static asset paths used in the RouteX app.
///
/// Always reference assets through this class — never use hard-coded
/// path strings anywhere else in the codebase.
///
/// Directory convention:
///   assets/images/svg/   → vector images (illustrations, logos)
///   assets/images/png/   → raster images (photos, graphics)
///   assets/images/jpg/   → raster photos
///   assets/icons/svg/    → vector icons
///   assets/icons/png/    → raster icons
class AppAssets {
  AppAssets._(); // prevent instantiation

  // ---------------------------------------------------------------------------
  // Images — SVG
  // ---------------------------------------------------------------------------

  /// RouteX logo mark (symbol only).
  static const String logo = 'assets/images/svg/logo.svg';

  /// RouteX logo with full wordmark beside it.

  // ---------------------------------------------------------------------------
  // Images — PNG
  // ---------------------------------------------------------------------------

  /// Hero graphic displayed on the first onboarding slide.
  static const String onboardingGraphic1 =
      'assets/images/png/onboarding_graphic_1.png';

  /// SVG illustration for the avatar/profile-picture placeholder.
  static const String appProfilePicture =
      'assets/images/svg/add_profile_picture.svg';

  /// RouteX brand logo in PNG format (used where SVG is unsupported).
  static const String logoPNG = 'assets/images/png/logo.png';

  /// Email-envelope icon displayed on the OTP verification screen.
  static const String otpEmailIllustrationPng =
      'assets/images/png/otp_email_icon.png';

  /// Red email-envelope icon shown when OTP verification fails.
  static const String otpEmailErrorIllustrationPng =
      'assets/images/png/otp_email_error_icon.png';

  /// Default solid avatar placeholder shown before a photo is picked.
  static const String avatarSolidPlaceholder =
      'assets/images/png/avatar_solid_placeholder.png';

  /// Illustration for the "You're All Set" success screen.
  static const String youreAllSetIllustrationPng =
      'assets/images/png/youre_all_set_illustration.png';

  // ---------------------------------------------------------------------------
  // Icons — SVG
  // ---------------------------------------------------------------------------
  /// Motorcycle vehicle-type icon.
  static const String iconMotorcycle = 'assets/images/svg/motorcycle.svg';

  /// Car vehicle-type icon.
  static const String iconCar = 'assets/images/svg/car.svg';

  /// Van vehicle-type icon.
  static const String iconVan = 'assets/images/svg/van.svg';

  /// Truck vehicle-type icon.
  static const String iconTruck = 'assets/images/svg/truck.svg';

  /// Person/profile outline icon.
  static const String iconPerson = 'assets/images/svg/ic_person.svg';

  /// Vehicle badge/plate icon.
  static const String iconVehicleBadge =
      'assets/images/svg/ic_vehicle_badge.svg';

  /// Lock (security) icon for the password step.
  static const String iconLock = 'assets/images/svg/ic_lock.svg';

  /// Google "G" brand logo for the social-login button.
  static const String googleLogo = 'assets/images/svg/google_g.svg';

  // ---------------------------------------------------------------------------
  // Icons — Dialog SVGs
  // ---------------------------------------------------------------------------

  /// Error / warning icon for alert dialogs (e.g. `AppDialogs.showErrorAlert`).
  static const String errorIcon = 'assets/images/svg/ic_alert_error.svg';

  /// Cancel / discard icon for confirmation dialogs.
  static const String discardIcon = 'assets/images/svg/ic_alert_discard.svg';

  /// Log-out icon for the sign-out confirmation dialog.
  static const String logoutIcon = 'assets/images/svg/ic_logout.svg';

  /// Success checkmark icon for positive-feedback dialogs.
  static const String successIcon = 'assets/images/svg/ic_success_check.svg';

  /// Expired-session / timeout icon.
  static const String sessionExpiredIcon =
      'assets/images/svg/ic_session_expired.svg';

  /// Location-pin icon for the "enable location" prompt.
  static const String enableLocationIcon = 'assets/images/svg/ic_location.svg';

  // ---------------------------------------------------------------------------
  // Animations — JSON / Lottie
  // ---------------------------------------------------------------------------
  /// Lottie JSON for the "You're All Set" celebration.
  static const String youreAllSetAnimation =
      'assets/animations/youre_all_set.json';

  /// Alternate Lottie JSON for the completion animation.
  static const String allSetAnimation = 'assets/animations/all_set.json';

  // ---------------------------------------------------------------------------
  // Icons — PNG
  // ---------------------------------------------------------------------------
  // Add raster icon paths here as the project grows.
}
