import 'dart:io';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:route_x/core/constants/app_assets.dart';
import 'package:route_x/core/theme/app_colors.dart';
import 'package:route_x/core/theme/app_fonts.dart';
import 'package:route_x/core/theme/app_spacing.dart';

/// A circular avatar placeholder with a green "+" badge.
///
/// Manages image selection internally via [ImagePicker]:
///  - Tapping opens a bottom-sheet with Camera / Gallery options.
///  - On selection, [onImagePicked] is fired with the [File].
///  - The chosen photo is immediately rendered inside the circle.
class RouteXAvatarPicker extends StatelessWidget {
  const RouteXAvatarPicker({
    super.key,
    this.currentImage,
    required this.onImageSourceSelected,
  });

  /// The currently selected profile image.
  final File? currentImage;

  /// Triggered with [true] for camera, [false] for gallery.
  final Function(bool isCamera) onImageSourceSelected;

  void _pickImage(BuildContext context, bool isCamera) {
    Navigator.of(context).pop(); // close BottomSheet first
    onImageSourceSelected(isCamera);
  }

  void _showImageSourceBottomSheet(BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
      ),
      builder: (_) => SafeArea(
        child: Wrap(
          children: [
            Center(
              child: Padding(
                padding: EdgeInsets.only(
                  top: AppSpacing.spacing12,
                  bottom: AppSpacing.spacing8,
                ),
                child: Container(
                  width: AppSpacing.spacing40,
                  height: 4.h,
                  decoration: BoxDecoration(
                    color: AppColors.emptyBarGray,
                    borderRadius: BorderRadius.circular(2.r),
                  ),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppSpacing.spacing20,
                vertical: AppSpacing.spacing8,
              ),
              child: Text(
                'Select Photo Source',
                style: TextStyle(
                  fontFamily: AppFonts.fontFamilySatoshi,
                  fontSize: AppFonts.font16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primaryBlack,
                ),
              ),
            ),

            ListTile(
              contentPadding: EdgeInsets.symmetric(
                horizontal: AppSpacing.spacing20,
                vertical: AppSpacing.spacing4,
              ),
              leading: Container(
                width: 40.w,
                height: 40.w,
                decoration: BoxDecoration(
                  color: AppColors.mainGreen.withValues(alpha: 0.12),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.camera_alt,
                  color: AppColors.mainGreen,
                  size: AppFonts.font20,
                ),
              ),
              title: Text(
                'Camera',
                style: TextStyle(
                  fontFamily: AppFonts.fontFamilySatoshi,
                  fontSize: AppFonts.font14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primaryBlack,
                ),
              ),
              onTap: () => _pickImage(context, true),
            ),

            ListTile(
              contentPadding: EdgeInsets.symmetric(
                horizontal: AppSpacing.spacing20,
                vertical: AppSpacing.spacing4,
              ),
              leading: Container(
                width: 40.w,
                height: 40.w,
                decoration: BoxDecoration(
                  color: AppColors.mainGreen.withValues(alpha: 0.12),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.photo_library,
                  color: AppColors.mainGreen,
                  size: AppFonts.font20,
                ),
              ),
              title: Text(
                'Gallery',
                style: TextStyle(
                  fontFamily: AppFonts.fontFamilySatoshi,
                  fontSize: AppFonts.font14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primaryBlack,
                ),
              ),
              onTap: () => _pickImage(context, false),
            ),

            SizedBox(height: AppSpacing.spacing16),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showImageSourceBottomSheet(context),
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // ─── Avatar circle + badge ──────────────────────────────────────
          SizedBox(
            width: 96.w,
            height: 96.w,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  padding: EdgeInsets.all(currentImage != null ? 4.r : 8.r),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: currentImage != null
                          ? AppColors.mainGreen
                          : Colors.grey.shade300,
                      width: currentImage != null ? 2.w : 1.5.w,
                    ),
                  ),
                  child: ClipOval(
                    child: currentImage != null
                        ? Image.file(
                            currentImage!,
                            width: double.infinity,
                            height: double.infinity,
                            fit: BoxFit.cover,
                          )
                        : Container(
                            color: Colors.grey.shade200,
                            width: double.infinity,
                            height: double.infinity,
                            child: Image.asset(
                              AppAssets.avatarSolidPlaceholder,
                            ),
                          ),
                  ),
                ),

                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(2.0),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Color(
                          0xFF8CE000,
                        ), // اللون الأخضر المطابق للتصميم
                        shape: BoxShape.circle,
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Icon(Icons.add, color: Colors.white, size: 22),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: AppSpacing.spacing8),

          Text(
            currentImage == null ? 'Add photo' : 'Change photo',
            style: TextStyle(
              fontFamily: AppFonts.fontFamilySatoshi,
              fontSize: AppFonts.font12,
              fontWeight: FontWeight.w400,
              color: AppColors.brandBlack,
            ),
          ),
        ],
      ),
    );
  }
}

/// A custom painter that draws a dashed circular border.
class DashedCirclePainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final int dashes;

  DashedCirclePainter({
    required this.color,
    this.strokeWidth = 2,
    this.dashes = 12,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final double radius = size.width / 2;
    final Paint paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final double dashAngle = (2 * math.pi) / (dashes * 2);

    for (int i = 0; i < dashes * 2; i += 2) {
      canvas.drawArc(
        Rect.fromCircle(center: Offset(radius, radius), radius: radius),
        i * dashAngle,
        dashAngle,
        false,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
