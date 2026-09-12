import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:route_x/core/constants/app_assets.dart';

class SplashBody extends StatelessWidget {
  const SplashBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(
        AppAssets.splashAnimation,
        fit: BoxFit.contain,
      ),
    );
  }
}
