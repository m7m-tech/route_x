import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:route_x/core/theme/app_colors.dart';
import 'package:route_x/core/theme/app_fonts.dart';

/// Standard wide submit button for the app.
class RouteXMainButton extends StatelessWidget {
  const RouteXMainButton({
    super.key,
    required this.isLoading,
    required this.onPressed,
    required this.text,
  });

  final bool isLoading;
  final VoidCallback? onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 52.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.mainGreen,
          foregroundColor: AppColors.brandBlack,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.r),
          ),
        ),
        onPressed: isLoading ? null : onPressed,
        child: isLoading
            ? SizedBox(
                width: 22.w,
                height: 22.w,
                child: const CircularProgressIndicator(
                  strokeWidth: 2.5,
                  color: AppColors.brandBlack,
                ),
              )
            : Text(
                text,
                style: TextStyle(
                  fontFamily: AppFonts.fontFamilySatoshi,
                  fontSize: AppFonts.font16,
                  fontWeight: FontWeight.w600,
                ),
              ),
      ),
    );
  }
}
