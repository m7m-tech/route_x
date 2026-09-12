import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:route_x/core/theme/app_colors.dart';
import 'package:route_x/core/theme/app_fonts.dart';

class RouteXPageHeader extends StatelessWidget {
  const RouteXPageHeader({
    super.key,
    required this.titleStart,
    required this.titleEnd,
    required this.subtitle,
    this.titleStartSize,
    this.titleEndSize,
    this.subtitleSize,
  });

  final String titleStart;
  final String titleEnd;
  final String subtitle;
  final double? titleStartSize;
  final double? titleEndSize;
  final double? subtitleSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            style: TextStyle(
              fontFamily: AppFonts.fontFamilySatoshi,
              fontSize: titleStartSize ?? AppFonts.font32,
              fontWeight: FontWeight.w700,
              height: 1.25,
            ),
            children: [
              TextSpan(
                text: '$titleStart\n',
                style: TextStyle(
                  color: AppColors.primaryBlack,
                  fontSize: titleStartSize ?? AppFonts.font32,
                ),
              ),
              TextSpan(
                text: titleEnd,
                style: TextStyle(
                  color: AppColors.mainGreen,
                  fontSize: titleEndSize ?? AppFonts.font32,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          subtitle,
          style: TextStyle(
            fontFamily: AppFonts.fontFamilySatoshi,
            fontSize: subtitleSize ?? AppFonts.font14,
            fontWeight: FontWeight.w400,
            color: AppColors.brandBlack,
            height: 1.4,
          ),
        ),
      ],
    );
  }
}
