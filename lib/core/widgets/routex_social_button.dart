// lib/core/widgets/routex_social_button.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:route_x/core/theme/app_colors.dart';
import 'package:route_x/core/theme/app_fonts.dart';

/// Generic full-width outlined social sign-in button.
///
/// Takes only an icon, a label, and a callback (Open/Closed: new providers
/// such as Apple or Facebook are added by passing a different [icon] and
/// label — this widget never changes).
class RouteXSocialButton extends StatelessWidget {
  const RouteXSocialButton({
    super.key,
    required this.icon,
    required this.label,
    required this.onPressed,
    this.isLoading = false,
  });

  final Widget icon;
  final String label;
  final VoidCallback? onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 52.h,
      child: OutlinedButton(
        onPressed: isLoading ? null : onPressed,
        style: OutlinedButton.styleFrom(
          backgroundColor: AppColors.white,
          foregroundColor: AppColors.brandBlack,
          elevation: 0,
          side: BorderSide(color: AppColors.textFieldStroke, width: 1.w),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.r),
          ),
        ),
        child: isLoading
            ? SizedBox(
                width: 22.w,
                height: 22.w,
                child: const CircularProgressIndicator(
                  strokeWidth: 2.5,
                  color: AppColors.mainGreen,
                ),
              )
            : Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  icon,
                  SizedBox(width: 12.w),
                  Text(
                    label,
                    style: TextStyle(
                      fontFamily: AppFonts.fontFamilySatoshi,
                      fontSize: AppFonts.font16,
                      fontWeight: FontWeight.w500,
                      color: AppColors.brandBlack,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
