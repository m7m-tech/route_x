// lib/core/network/auth_status_controller.dart
import 'package:flutter/foundation.dart';

/// Global signal channel for session-level lifecycle events.
///
/// The refresh interceptor (and repository layers) call [forceLogout] when the
/// session can no longer be refreshed (expired/invalid refresh token). The app
/// root listens to this and routes back to the Login screen — the "refresh
/// failing" path is a first-class logout, not a generic error toast.
class AuthStatusController extends ChangeNotifier {
  int _logoutVersion = 0;

  /// Monotonic counter bumped on every forced logout. Consumers can use this
  /// (instead of `notifyListeners` bookkeeping) to trigger de-duplicated
  /// navigation.
  int get logoutVersion => _logoutVersion;

  /// Clears nothing by itself — simply broadcasts that the session is over so
  /// the app root can navigate to Login.
  void forceLogout() {
    _logoutVersion++;
    notifyListeners();
  }
}
