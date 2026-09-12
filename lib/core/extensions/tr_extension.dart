import 'package:flutter/material.dart';
import 'package:route_x/core/l10n/app_localizations.dart';

/// Convenience extension on [BuildContext] for quick access to localized strings.
///
/// Usage: `context.tr.fullName` instead of `AppLocalizations.of(context)!.fullName`.
extension TranslateExtension on BuildContext {
  /// Shorthand accessor for the nearest [AppLocalizations] instance.
  AppLocalizations get tr => AppLocalizations.of(this)!;

  /// Resolves raw string keys from the domain layer (AuthValidators)
  /// into fully localized user-facing strings.
  String translateValidationKey(String key) {
    switch (key) {
      case 'errNameRequired':
        return tr.errNameRequired;
      case 'errNameMinLength':
        return tr.errNameMinLength;
      case 'errEmailRequired':
        return tr.errEmailRequired;
      case 'errEmailInvalid':
        return tr.errEmailInvalid;
      case 'errPhoneRequired':
        return tr.errPhoneRequired;
      case 'errPhoneInvalid':
        return tr.errPhoneInvalid;
      case 'errPasswordRequired':
        return tr.errPasswordRequired;
      case 'errPasswordMismatch':
        return tr.errPasswordMismatch;
      case 'errPasswordMinLength':
        return tr.errPasswordMinLength;
      case 'errPasswordUppercase':
        return tr.errPasswordUppercase;
      case 'errPasswordLowercase':
        return tr.errPasswordLowercase;
      case 'errPasswordNumber':
        return tr.errPasswordNumber;
      case 'errPasswordSymbol':
        return tr.errPasswordSymbol;
      case 'errOtpRequired':
        return tr.errOtpRequired;
      case 'errOtpInvalid':
        return tr.errOtpInvalid;
      case 'errVehicleRequired':
        return tr.errVehicleRequired;
      case 'errResetTokenRequired':
        return tr.errResetTokenRequired;
      case 'errRefreshTokenRequired':
        return tr.errRefreshTokenRequired;
      case 'errOrderAddressRequired':
        return tr.errOrderAddressRequired;
      case 'errPickupLocationRequired':
        return tr.errPickupLocationRequired;
      case 'errDropoffLocationRequired':
        return tr.errDropoffLocationRequired;
      case 'errLoggedOut':
        return tr.errLoggedOut;
      default:
        return key;
    }
  }
}
