import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:route_x/core/di/injection.dart';
import 'package:route_x/core/l10n/app_localizations.dart';
import 'package:route_x/core/bloc/language/language_bloc.dart';
import 'package:route_x/core/constants/app_sizes.dart';
import 'package:route_x/core/network/auth_status_controller.dart';
import 'package:route_x/core/router/app_routes.dart';
import 'package:route_x/core/services/navigator_service.dart';

// ── Global key for showing SnackBars from anywhere ──────────────────────────
var globalMessengerKey = GlobalKey<ScaffoldMessengerState>();

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupDependencyInjection();

  // 🚨 CRITICAL: Device orientation lock - DO NOT REMOVE
  Future.wait([
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]),
  ]).then((value) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // LanguageBloc is global — any screen can read or toggle it.
        BlocProvider<LanguageBloc>(create: (_) => LanguageBloc()),
        // ── Add other global Btrs here (AuthBloc, ThemeBloc …) ──
      ],
      child: ScreenUtilInit(
        designSize: const Size(
          AppSizes.figmaDesignWidth,
          AppSizes.figmaDesignHeight,
        ),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          // BlocBuilder wraps MaterialApp so that the entire widget tree
          // rebuilds with the new locale when LanguageBloc emits a new state.
          return BlocBuilder<LanguageBloc, LanguageState>(
            builder: (context, languageState) {
              return _AuthLogoutWatcher(
                controller: getIt<AuthStatusController>(),
                child: MaterialApp(
                  title: 'RouteX',
                  scaffoldMessengerKey: globalMessengerKey,
                  // 🚨 CRITICAL: lock text scaling — DO NOT REMOVE
                  builder: (context, child) {
                    return MediaQuery(
                      data: MediaQuery.of(
                        context,
                      ).copyWith(textScaler: const TextScaler.linear(1.0)),
                      child: child!,
                    );
                  },
                  // 🚨 END CRITICAL SECTION
                  navigatorKey: NavigatorService.navigatorKey,
                  debugShowCheckedModeBanner: false,
                  // Dynamic locale driven by LanguageBloc
                  locale: Locale(languageState.languageCode),
                  localizationsDelegates: [
                    AppLocalizations.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  supportedLocales: AppLocalizations.supportedLocales,
                  initialRoute: AppRoutes.initialRoute,
                  routes: AppRoutes.routes,
                  onGenerateRoute: AppRoutes.onGenerateRoute,
                ),
              );
            },
          );
        },
      ),
    );
  }
}

/// Listens to [AuthStatusController] and, on a forced logout (expired /
/// unrefreshable session), tears down the navigation stack back to Login.
///
/// Only reacts when the logout *version* advances, so the same interrupted
/// session can never trigger repeated navigation.
class _AuthLogoutWatcher extends StatefulWidget {
  const _AuthLogoutWatcher({required this.controller, required this.child});

  final AuthStatusController controller;
  final Widget child;

  @override
  State<_AuthLogoutWatcher> createState() => _AuthLogoutWatcherState();
}

class _AuthLogoutWatcherState extends State<_AuthLogoutWatcher> {
  late int _lastLogoutVersion;

  @override
  void initState() {
    super.initState();
    _lastLogoutVersion = widget.controller.logoutVersion;
    widget.controller.addListener(_onAuthStatusChanged);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_onAuthStatusChanged);
    super.dispose();
  }

  void _onAuthStatusChanged() {
    if (widget.controller.logoutVersion == _lastLogoutVersion) return;
    _lastLogoutVersion = widget.controller.logoutVersion;

    final navigator = NavigatorService.navigatorKey.currentState;
    navigator?.pushNamedAndRemoveUntil(
      AppRoutes.driverLoginScreen,
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
