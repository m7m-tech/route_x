import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:route_x/core/constants/app_assets.dart';

/// Renders the RouteX brand logo SVG, left-aligned.
///
/// Used on authentication and onboarding screens as a recognisable brand
/// anchor. The logo width scales responsively via [flutter_screenutil].
class RouteXLogo extends StatelessWidget {
  const RouteXLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: SvgPicture.asset(
        AppAssets.logo,
        width: 100.w,
        fit: BoxFit.contain,
      ),
    );
  }
}
