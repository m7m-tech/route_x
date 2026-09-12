import 'package:flutter/material.dart';

/// Provides a global `navigatorKey` so that navigation can be triggered
/// from anywhere (e.g. from BLoCs or services) without a `BuildContext`.
class NavigatorService {
  NavigatorService._(); // prevent instantiation

  /// Global navigator key passed to [MaterialApp.navigatorKey].
  ///
  /// Enables programmatic navigation from layers that do not hold a
  /// [BuildContext], such as interceptors or DI-constructed services.
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();
}
