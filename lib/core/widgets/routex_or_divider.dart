// lib/core/widgets/routex_or_divider.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:route_x/core/extensions/tr_extension.dart';
import 'package:route_x/core/theme/app_colors.dart';
import 'package:route_x/core/theme/app_fonts.dart';
import 'package:route_x/core/theme/app_spacing.dart';

/// A thin horizontal line — centered "or" — thin horizontal line.
///
/// Used between the primary submit button and social sign-in options on
/// Login / Signup. The label is localized and flips automatically in RTL.
class RouteXOrDivider extends StatelessWidget {
  const RouteXOrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: _OrLine()),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSpacing.spacing16),
          child: Text(
            context.tr.or,
            style: TextStyle(
              fontFamily: AppFonts.fontFamilySatoshi,
              fontSize: AppFonts.font14,
              fontWeight: FontWeight.w400,
              color: AppColors.secondaryTextGray,
            ),
          ),
        ),
        const Expanded(child: _OrLine()),
      ],
    );
  }
}

/// A single hairline segment of the divider.
class _OrLine extends StatelessWidget {
  const _OrLine();

  @override
  Widget build(BuildContext context) {
    return Container(height: 1.h, color: AppColors.emptyBarGray);
  }
}
