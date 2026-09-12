import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
  ];

  /// No description provided for @letsGet.
  ///
  /// In en, this message translates to:
  /// **'Let\'s get'**
  String get letsGet;

  /// No description provided for @started.
  ///
  /// In en, this message translates to:
  /// **'started!'**
  String get started;

  /// No description provided for @createYourAccount.
  ///
  /// In en, this message translates to:
  /// **'Create your account to start \ndelivering smarter.'**
  String get createYourAccount;

  /// No description provided for @fullName.
  ///
  /// In en, this message translates to:
  /// **'Full Name'**
  String get fullName;

  /// No description provided for @email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get email;

  /// No description provided for @phoneNumber.
  ///
  /// In en, this message translates to:
  /// **'Phone Number'**
  String get phoneNumber;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @alreadyHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Already have an account? '**
  String get alreadyHaveAccount;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @enterYourFullName.
  ///
  /// In en, this message translates to:
  /// **'Enter your full name'**
  String get enterYourFullName;

  /// No description provided for @enterYourEmail.
  ///
  /// In en, this message translates to:
  /// **'Enter your email'**
  String get enterYourEmail;

  /// No description provided for @somethingWentWrong.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong.'**
  String get somethingWentWrong;

  /// No description provided for @driverLoginScreenTodo.
  ///
  /// In en, this message translates to:
  /// **'Driver Login Screen — TODO'**
  String get driverLoginScreenTodo;

  /// No description provided for @welcomeBack.
  ///
  /// In en, this message translates to:
  /// **'Welcome'**
  String get welcomeBack;

  /// No description provided for @welcomeBackHighlight.
  ///
  /// In en, this message translates to:
  /// **'back.'**
  String get welcomeBackHighlight;

  /// No description provided for @loginSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Sign in to continue\noptimizing your routes.'**
  String get loginSubtitle;

  /// No description provided for @forgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password?'**
  String get forgotPassword;

  /// No description provided for @dontHaveAccount.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account? '**
  String get dontHaveAccount;

  /// No description provided for @signUp.
  ///
  /// In en, this message translates to:
  /// **'Sign Up'**
  String get signUp;

  /// No description provided for @errPasswordRequired.
  ///
  /// In en, this message translates to:
  /// **'Password is required'**
  String get errPasswordRequired;

  /// No description provided for @errPasswordMismatch.
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match'**
  String get errPasswordMismatch;

  /// No description provided for @errPasswordMinLength.
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 8 characters'**
  String get errPasswordMinLength;

  /// No description provided for @errPasswordUppercase.
  ///
  /// In en, this message translates to:
  /// **'Include at least one uppercase letter'**
  String get errPasswordUppercase;

  /// No description provided for @errPasswordLowercase.
  ///
  /// In en, this message translates to:
  /// **'Include at least one lowercase letter'**
  String get errPasswordLowercase;

  /// No description provided for @errPasswordNumber.
  ///
  /// In en, this message translates to:
  /// **'Include at least one number'**
  String get errPasswordNumber;

  /// No description provided for @errPasswordSymbol.
  ///
  /// In en, this message translates to:
  /// **'Include at least one special character'**
  String get errPasswordSymbol;

  /// No description provided for @errOtpRequired.
  ///
  /// In en, this message translates to:
  /// **'Verification code is required'**
  String get errOtpRequired;

  /// No description provided for @errOtpInvalid.
  ///
  /// In en, this message translates to:
  /// **'Enter a valid 6-digit code'**
  String get errOtpInvalid;

  /// No description provided for @errVehicleRequired.
  ///
  /// In en, this message translates to:
  /// **'Vehicle type and number are required for drivers'**
  String get errVehicleRequired;

  /// No description provided for @errResetTokenRequired.
  ///
  /// In en, this message translates to:
  /// **'Reset token is required'**
  String get errResetTokenRequired;

  /// No description provided for @errRefreshTokenRequired.
  ///
  /// In en, this message translates to:
  /// **'Refresh token is required'**
  String get errRefreshTokenRequired;

  /// No description provided for @errOrderAddressRequired.
  ///
  /// In en, this message translates to:
  /// **'Pickup and dropoff addresses are required'**
  String get errOrderAddressRequired;

  /// No description provided for @errPickupLocationRequired.
  ///
  /// In en, this message translates to:
  /// **'Pickup location is required'**
  String get errPickupLocationRequired;

  /// No description provided for @errDropoffLocationRequired.
  ///
  /// In en, this message translates to:
  /// **'Dropoff location is required'**
  String get errDropoffLocationRequired;

  /// No description provided for @errLoggedOut.
  ///
  /// In en, this message translates to:
  /// **'Please log in to continue'**
  String get errLoggedOut;

  /// No description provided for @or.
  ///
  /// In en, this message translates to:
  /// **'Or'**
  String get or;

  /// No description provided for @continueWithGoogle.
  ///
  /// In en, this message translates to:
  /// **'Continue with Google'**
  String get continueWithGoogle;

  /// No description provided for @driverRegistrationScreenTodo.
  ///
  /// In en, this message translates to:
  /// **'Driver Registration Screen — TODO'**
  String get driverRegistrationScreenTodo;

  /// No description provided for @setNewPasswordScreenTodo.
  ///
  /// In en, this message translates to:
  /// **'Set New Password Screen — TODO'**
  String get setNewPasswordScreenTodo;

  /// No description provided for @verifyCodeScreenTodo.
  ///
  /// In en, this message translates to:
  /// **'Verify Code Screen — TODO'**
  String get verifyCodeScreenTodo;

  /// No description provided for @onboardingHeadline1.
  ///
  /// In en, this message translates to:
  /// **'Deliver '**
  String get onboardingHeadline1;

  /// No description provided for @onboardingHeadline2.
  ///
  /// In en, this message translates to:
  /// **'More.'**
  String get onboardingHeadline2;

  /// No description provided for @onboardingHeadline3.
  ///
  /// In en, this message translates to:
  /// **'\nDrive '**
  String get onboardingHeadline3;

  /// No description provided for @onboardingHeadline4.
  ///
  /// In en, this message translates to:
  /// **'Less.'**
  String get onboardingHeadline4;

  /// No description provided for @onboardingSubheadline.
  ///
  /// In en, this message translates to:
  /// **'Smarter routes, fewer miles.\nBetter results for your business.'**
  String get onboardingSubheadline;

  /// No description provided for @getStarted.
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get getStarted;

  /// No description provided for @appNavigationScreenTodo.
  ///
  /// In en, this message translates to:
  /// **'App Navigation Screen — TODO'**
  String get appNavigationScreenTodo;

  /// No description provided for @step2ComingSoon.
  ///
  /// In en, this message translates to:
  /// **'Step 2 — Coming soon'**
  String get step2ComingSoon;

  /// No description provided for @selectCountryCode.
  ///
  /// In en, this message translates to:
  /// **'Select Country Code'**
  String get selectCountryCode;

  /// No description provided for @searchCountry.
  ///
  /// In en, this message translates to:
  /// **'Search country...'**
  String get searchCountry;

  /// No description provided for @noResultsFound.
  ///
  /// In en, this message translates to:
  /// **'No results found'**
  String get noResultsFound;

  /// No description provided for @countryPalestine.
  ///
  /// In en, this message translates to:
  /// **'Palestine'**
  String get countryPalestine;

  /// No description provided for @countrySaudiArabia.
  ///
  /// In en, this message translates to:
  /// **'Saudi Arabia'**
  String get countrySaudiArabia;

  /// No description provided for @countryEgypt.
  ///
  /// In en, this message translates to:
  /// **'Egypt'**
  String get countryEgypt;

  /// No description provided for @countryUAE.
  ///
  /// In en, this message translates to:
  /// **'United Arab Emirates'**
  String get countryUAE;

  /// No description provided for @countryJordan.
  ///
  /// In en, this message translates to:
  /// **'Jordan'**
  String get countryJordan;

  /// No description provided for @countryQatar.
  ///
  /// In en, this message translates to:
  /// **'Qatar'**
  String get countryQatar;

  /// No description provided for @countryKuwait.
  ///
  /// In en, this message translates to:
  /// **'Kuwait'**
  String get countryKuwait;

  /// No description provided for @countryOman.
  ///
  /// In en, this message translates to:
  /// **'Oman'**
  String get countryOman;

  /// No description provided for @countryBahrain.
  ///
  /// In en, this message translates to:
  /// **'Bahrain'**
  String get countryBahrain;

  /// No description provided for @errNameRequired.
  ///
  /// In en, this message translates to:
  /// **'Full name is required'**
  String get errNameRequired;

  /// No description provided for @errNameMinLength.
  ///
  /// In en, this message translates to:
  /// **'Name must be at least 3 characters'**
  String get errNameMinLength;

  /// No description provided for @errEmailRequired.
  ///
  /// In en, this message translates to:
  /// **'Email is required'**
  String get errEmailRequired;

  /// No description provided for @errEmailInvalid.
  ///
  /// In en, this message translates to:
  /// **'Enter a valid email address'**
  String get errEmailInvalid;

  /// No description provided for @errPhoneRequired.
  ///
  /// In en, this message translates to:
  /// **'Phone number is required'**
  String get errPhoneRequired;

  /// No description provided for @errPhoneInvalid.
  ///
  /// In en, this message translates to:
  /// **'Enter a valid phone number'**
  String get errPhoneInvalid;

  /// No description provided for @tellUsAboutYour.
  ///
  /// In en, this message translates to:
  /// **'Tell us about'**
  String get tellUsAboutYour;

  /// No description provided for @vehicle.
  ///
  /// In en, this message translates to:
  /// **'your vehicle.'**
  String get vehicle;

  /// No description provided for @vehicleSubtitle.
  ///
  /// In en, this message translates to:
  /// **'This helps us match you with\nthe right deliveries. '**
  String get vehicleSubtitle;

  /// No description provided for @vehicleMotorcycle.
  ///
  /// In en, this message translates to:
  /// **'Motorcycle'**
  String get vehicleMotorcycle;

  /// No description provided for @vehicleCar.
  ///
  /// In en, this message translates to:
  /// **'Car'**
  String get vehicleCar;

  /// No description provided for @vehicleVan.
  ///
  /// In en, this message translates to:
  /// **'Van'**
  String get vehicleVan;

  /// No description provided for @vehicleTruck.
  ///
  /// In en, this message translates to:
  /// **'Truck'**
  String get vehicleTruck;

  /// No description provided for @vehicleNumber.
  ///
  /// In en, this message translates to:
  /// **'Vehicle Plate Number'**
  String get vehicleNumber;

  /// No description provided for @vehicleNumberHint.
  ///
  /// In en, this message translates to:
  /// **'Enter vehicle number'**
  String get vehicleNumberHint;

  /// No description provided for @createA.
  ///
  /// In en, this message translates to:
  /// **'Create a'**
  String get createA;

  /// No description provided for @securePassword.
  ///
  /// In en, this message translates to:
  /// **'secure password.'**
  String get securePassword;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @passwordSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Keep your account safe with\na strong password.'**
  String get passwordSubtitle;

  /// No description provided for @enterPassword.
  ///
  /// In en, this message translates to:
  /// **'Enter password'**
  String get enterPassword;

  /// No description provided for @confirmPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get confirmPassword;

  /// No description provided for @passwordRequirements.
  ///
  /// In en, this message translates to:
  /// **'Password requirements'**
  String get passwordRequirements;

  /// No description provided for @reqMinLength.
  ///
  /// In en, this message translates to:
  /// **'At least 8 characters'**
  String get reqMinLength;

  /// No description provided for @reqCapitalLetter.
  ///
  /// In en, this message translates to:
  /// **'Includes an uppercase letter'**
  String get reqCapitalLetter;

  /// No description provided for @reqNumber.
  ///
  /// In en, this message translates to:
  /// **'Includes a number'**
  String get reqNumber;

  /// No description provided for @reqSymbol.
  ///
  /// In en, this message translates to:
  /// **'Includes a special character'**
  String get reqSymbol;

  /// No description provided for @createAccount.
  ///
  /// In en, this message translates to:
  /// **'Create Account'**
  String get createAccount;

  /// No description provided for @byCreatingAccount.
  ///
  /// In en, this message translates to:
  /// **'By creating an account, you agree to our \n'**
  String get byCreatingAccount;

  /// No description provided for @termsOfService.
  ///
  /// In en, this message translates to:
  /// **'Terms of Service'**
  String get termsOfService;

  /// No description provided for @and.
  ///
  /// In en, this message translates to:
  /// **' and '**
  String get and;

  /// No description provided for @privacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyPolicy;

  /// No description provided for @verifyYourEmailTitle.
  ///
  /// In en, this message translates to:
  /// **'Verify your'**
  String get verifyYourEmailTitle;

  /// No description provided for @verifyYourEmailTitleHighlight.
  ///
  /// In en, this message translates to:
  /// **'email.'**
  String get verifyYourEmailTitleHighlight;

  /// No description provided for @otpSentToEmailMessage.
  ///
  /// In en, this message translates to:
  /// **'We\'ve sent a 6-digit verification code to\nyour email to activate your account.'**
  String get otpSentToEmailMessage;

  /// No description provided for @didntReceiveCode.
  ///
  /// In en, this message translates to:
  /// **'Didn\'t receive the code? '**
  String get didntReceiveCode;

  /// No description provided for @resendCode.
  ///
  /// In en, this message translates to:
  /// **'Resend code'**
  String get resendCode;

  /// No description provided for @useDifferentEmail.
  ///
  /// In en, this message translates to:
  /// **'Use a different email'**
  String get useDifferentEmail;

  /// No description provided for @brandRoute.
  ///
  /// In en, this message translates to:
  /// **'Route'**
  String get brandRoute;

  /// No description provided for @brandX.
  ///
  /// In en, this message translates to:
  /// **'X'**
  String get brandX;

  /// No description provided for @youAreAllSet.
  ///
  /// In en, this message translates to:
  /// **'You\'re all set!'**
  String get youAreAllSet;

  /// No description provided for @accountCreatedSuccess.
  ///
  /// In en, this message translates to:
  /// **'Your account has been created successfully. Welcome to RouteX!'**
  String get accountCreatedSuccess;

  /// No description provided for @continueToHome.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueToHome;

  /// No description provided for @reviewYourDetailsTitle.
  ///
  /// In en, this message translates to:
  /// **'Review your'**
  String get reviewYourDetailsTitle;

  /// No description provided for @reviewYourDetailsHighlight.
  ///
  /// In en, this message translates to:
  /// **'Details!'**
  String get reviewYourDetailsHighlight;

  /// No description provided for @reviewDetailsSubtext.
  ///
  /// In en, this message translates to:
  /// **'Make sure everything looks good before you continue.'**
  String get reviewDetailsSubtext;

  /// No description provided for @editLabel.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get editLabel;

  /// No description provided for @vehicleTypeLabel.
  ///
  /// In en, this message translates to:
  /// **'VEHICLE TYPE'**
  String get vehicleTypeLabel;

  /// No description provided for @vehicleNumberLabel.
  ///
  /// In en, this message translates to:
  /// **'VEHICLE NUMBER'**
  String get vehicleNumberLabel;

  /// No description provided for @verifyEmailButton.
  ///
  /// In en, this message translates to:
  /// **'Verify email'**
  String get verifyEmailButton;

  /// No description provided for @emailOrPassword.
  ///
  /// In en, this message translates to:
  /// **'email or phome'**
  String get emailOrPassword;

  /// No description provided for @detailsReadyCaptionLine.
  ///
  /// In en, this message translates to:
  /// **'Your details are ready.\nVerify your email to activate your account.'**
  String get detailsReadyCaptionLine;

  /// No description provided for @reviewYour.
  ///
  /// In en, this message translates to:
  /// **'Review your'**
  String get reviewYour;

  /// No description provided for @detailsExclamation.
  ///
  /// In en, this message translates to:
  /// **'Details!'**
  String get detailsExclamation;

  /// No description provided for @verifyEmail.
  ///
  /// In en, this message translates to:
  /// **'Verify email'**
  String get verifyEmail;

  /// No description provided for @makeSureEverythingLooksGood.
  ///
  /// In en, this message translates to:
  /// **'Make sure everything looks good\nbefore you continue.'**
  String get makeSureEverythingLooksGood;

  /// No description provided for @reviewDetailsButton.
  ///
  /// In en, this message translates to:
  /// **'Review details'**
  String get reviewDetailsButton;

  /// No description provided for @otpCodeMismatchTitle.
  ///
  /// In en, this message translates to:
  /// **'The code you entered is incorrect.'**
  String get otpCodeMismatchTitle;

  /// No description provided for @otpCodeMismatchSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Please check the code and try again.'**
  String get otpCodeMismatchSubtitle;

  /// No description provided for @forgetPasswordTitle.
  ///
  /// In en, this message translates to:
  /// **'Reset your'**
  String get forgetPasswordTitle;

  /// No description provided for @forgetPasswordTitleHighlight.
  ///
  /// In en, this message translates to:
  /// **'password.'**
  String get forgetPasswordTitleHighlight;

  /// No description provided for @forgetPasswordSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Enter your email to receive a\nverification code.'**
  String get forgetPasswordSubtitle;

  /// No description provided for @sendResetLink.
  ///
  /// In en, this message translates to:
  /// **'Send reset link'**
  String get sendResetLink;

  /// No description provided for @checkYourEmail.
  ///
  /// In en, this message translates to:
  /// **'Check your'**
  String get checkYourEmail;

  /// No description provided for @checkYourEmailHighlight.
  ///
  /// In en, this message translates to:
  /// **'email.'**
  String get checkYourEmailHighlight;

  /// No description provided for @forgotOtpSentMessage.
  ///
  /// In en, this message translates to:
  /// **'We\'ve sent a 6-digit code to reset\nyour password.'**
  String get forgotOtpSentMessage;

  /// No description provided for @setNewPasswordTitle.
  ///
  /// In en, this message translates to:
  /// **'Set a new'**
  String get setNewPasswordTitle;

  /// No description provided for @setNewPasswordTitleHighlight.
  ///
  /// In en, this message translates to:
  /// **'password.'**
  String get setNewPasswordTitleHighlight;

  /// No description provided for @setNewPasswordSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Your new password must be different\nfrom your previous passwords.'**
  String get setNewPasswordSubtitle;

  /// No description provided for @resetPasswordButton.
  ///
  /// In en, this message translates to:
  /// **'Reset password'**
  String get resetPasswordButton;

  /// No description provided for @passwordResetSuccess.
  ///
  /// In en, this message translates to:
  /// **'Your password has been reset successfully.'**
  String get passwordResetSuccess;

  /// No description provided for @verificationCodeSentMessage.
  ///
  /// In en, this message translates to:
  /// **'We\'ve sent a 6-digit verification code to\nyour email to activate your account.'**
  String get verificationCodeSentMessage;

  /// No description provided for @youreReadyTitleStart.
  ///
  /// In en, this message translates to:
  /// **'You\'re ready'**
  String get youreReadyTitleStart;

  /// No description provided for @youreReadyTitleEnd.
  ///
  /// In en, this message translates to:
  /// **'to roll!'**
  String get youreReadyTitleEnd;

  /// No description provided for @youreAllSetSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Your account is ready.\nexplore the app and start driving.'**
  String get youreAllSetSubtitle;

  /// No description provided for @startDrivingLabel.
  ///
  /// In en, this message translates to:
  /// **'Start driving'**
  String get startDrivingLabel;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
