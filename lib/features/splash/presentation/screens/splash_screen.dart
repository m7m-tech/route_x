import 'package:flutter/material.dart';
import 'package:route_x/core/di/injection.dart';
import 'package:route_x/core/router/app_routes.dart';
import 'package:route_x/features/onboarding/domain/repositories/onboarding_repository.dart';
import 'package:route_x/features/splash/presentation/widgets/splash_body.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }

  Future<void> _navigateToNextScreen() async {
    // Wait for the splash animation to finish smoothly
    await Future.delayed(const Duration(milliseconds: 4000));
    if (!mounted) return;

    try {
      final repository = getIt<OnboardingRepository>();
      final hasCompleted = await repository.hasCompletedOnboarding();
      if (!mounted) return;

      if (hasCompleted) {
        Navigator.pushReplacementNamed(context, AppRoutes.driverLoginScreen);
      } else {
        Navigator.pushReplacementNamed(context, AppRoutes.onboardingScreen);
      }
    } catch (_) {
      if (mounted) {
        Navigator.pushReplacementNamed(context, AppRoutes.onboardingScreen);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(backgroundColor: Colors.white, body: SplashBody());
  }
}
