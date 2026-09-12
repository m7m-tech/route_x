import 'package:flutter/painting.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:route_x/core/theme/app_fonts.dart';

/// Design token text styles exported from Figma.
///
/// Font family: **Satoshi**
/// Font sizes use `.sp` from [flutter_screenutil].
///
/// Naming pattern: `s{fontSize}{Weight}` — e.g. `s14Regular`, `s20SemiBold`.
/// Each style includes the matched `height` factor derived from the
/// (lineHeight / fontSize) ratio in the Figma tokens.
class AppTextStyles {
  AppTextStyles._();

  // ---------------------------------------------------------------------------
  // Font Size 10  |  Line-height 14
  // ---------------------------------------------------------------------------
  static TextStyle get s10Regular => TextStyle(
    fontFamily: AppFonts.fontFamilySatoshi,
    fontSize: 10.sp,
    fontWeight: FontWeight.w400,
    height: 14 / 10,
  );

  static TextStyle get s10Medium => TextStyle(
    fontFamily: AppFonts.fontFamilySatoshi,
    fontSize: 10.sp,
    fontWeight: FontWeight.w500,
    height: 14 / 10,
  );

  static TextStyle get s10SemiBold => TextStyle(
    fontFamily: AppFonts.fontFamilySatoshi,
    fontSize: 10.sp,
    fontWeight: FontWeight.w600,
    height: 14 / 10,
  );

  static TextStyle get s10Bold => TextStyle(
    fontFamily: AppFonts.fontFamilySatoshi,
    fontSize: 10.sp,
    fontWeight: FontWeight.w700,
    height: 14 / 10,
  );

  // ---------------------------------------------------------------------------
  // Font Size 11  |  Line-height 15
  // ---------------------------------------------------------------------------
  static TextStyle get s11Regular => TextStyle(
    fontFamily: AppFonts.fontFamilySatoshi,
    fontSize: 11.sp,
    fontWeight: FontWeight.w400,
    height: 15 / 11,
  );

  static TextStyle get s11Medium => TextStyle(
    fontFamily: AppFonts.fontFamilySatoshi,
    fontSize: 11.sp,
    fontWeight: FontWeight.w500,
    height: 15 / 11,
  );

  static TextStyle get s11SemiBold => TextStyle(
    fontFamily: AppFonts.fontFamilySatoshi,
    fontSize: 11.sp,
    fontWeight: FontWeight.w600,
    height: 15 / 11,
  );

  static TextStyle get s11Bold => TextStyle(
    fontFamily: AppFonts.fontFamilySatoshi,
    fontSize: 11.sp,
    fontWeight: FontWeight.w700,
    height: 15 / 11,
  );

  // ---------------------------------------------------------------------------
  // Font Size 12  |  Line-height 16
  // ---------------------------------------------------------------------------
  static TextStyle get s12Regular => TextStyle(
    fontFamily: AppFonts.fontFamilySatoshi,
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    height: 16 / 12,
  );

  static TextStyle get s12Medium => TextStyle(
    fontFamily: AppFonts.fontFamilySatoshi,
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
    height: 16 / 12,
  );

  static TextStyle get s12SemiBold => TextStyle(
    fontFamily: AppFonts.fontFamilySatoshi,
    fontSize: 12.sp,
    fontWeight: FontWeight.w600,
    height: 16 / 12,
  );

  static TextStyle get s12Bold => TextStyle(
    fontFamily: AppFonts.fontFamilySatoshi,
    fontSize: 12.sp,
    fontWeight: FontWeight.w700,
    height: 16 / 12,
  );

  // ---------------------------------------------------------------------------
  // Font Size 14  |  Line-height 20
  // ---------------------------------------------------------------------------
  static TextStyle get s14Regular => TextStyle(
    fontFamily: AppFonts.fontFamilySatoshi,
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
    height: 20 / 14,
  );

  static TextStyle get s14Medium => TextStyle(
    fontFamily: AppFonts.fontFamilySatoshi,
    fontSize: 14.sp,
    fontWeight: FontWeight.w500,
    height: 20 / 14,
  );

  static TextStyle get s14SemiBold => TextStyle(
    fontFamily: AppFonts.fontFamilySatoshi,
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
    height: 20 / 14,
  );

  static TextStyle get s14Bold => TextStyle(
    fontFamily: AppFonts.fontFamilySatoshi,
    fontSize: 14.sp,
    fontWeight: FontWeight.w700,
    height: 20 / 14,
  );

  // ---------------------------------------------------------------------------
  // Font Size 16  |  Line-height 22
  // ---------------------------------------------------------------------------
  static TextStyle get s16Regular => TextStyle(
    fontFamily: AppFonts.fontFamilySatoshi,
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    height: 22 / 16,
  );

  static TextStyle get s16Medium => TextStyle(
    fontFamily: AppFonts.fontFamilySatoshi,
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    height: 22 / 16,
  );

  static TextStyle get s16SemiBold => TextStyle(
    fontFamily: AppFonts.fontFamilySatoshi,
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    height: 22 / 16,
  );

  static TextStyle get s16Bold => TextStyle(
    fontFamily: AppFonts.fontFamilySatoshi,
    fontSize: 16.sp,
    fontWeight: FontWeight.w700,
    height: 22 / 16,
  );

  // ---------------------------------------------------------------------------
  // Font Size 20  |  Line-height 28
  // ---------------------------------------------------------------------------
  static TextStyle get s20Regular => TextStyle(
    fontFamily: AppFonts.fontFamilySatoshi,
    fontSize: 20.sp,
    fontWeight: FontWeight.w400,
    height: 28 / 20,
  );

  static TextStyle get s20Medium => TextStyle(
    fontFamily: AppFonts.fontFamilySatoshi,
    fontSize: 20.sp,
    fontWeight: FontWeight.w500,
    height: 28 / 20,
  );

  static TextStyle get s20SemiBold => TextStyle(
    fontFamily: AppFonts.fontFamilySatoshi,
    fontSize: 20.sp,
    fontWeight: FontWeight.w600,
    height: 28 / 20,
  );

  static TextStyle get s20Bold => TextStyle(
    fontFamily: AppFonts.fontFamilySatoshi,
    fontSize: 20.sp,
    fontWeight: FontWeight.w700,
    height: 28 / 20,
  );

  // ---------------------------------------------------------------------------
  // Font Size 24  |  Line-height 34
  // ---------------------------------------------------------------------------
  static TextStyle get s24Regular => TextStyle(
    fontFamily: AppFonts.fontFamilySatoshi,
    fontSize: 24.sp,
    fontWeight: FontWeight.w400,
    height: 34 / 24,
  );

  static TextStyle get s24Medium => TextStyle(
    fontFamily: AppFonts.fontFamilySatoshi,
    fontSize: 24.sp,
    fontWeight: FontWeight.w500,
    height: 34 / 24,
  );

  static TextStyle get s24SemiBold => TextStyle(
    fontFamily: AppFonts.fontFamilySatoshi,
    fontSize: 24.sp,
    fontWeight: FontWeight.w600,
    height: 34 / 24,
  );

  static TextStyle get s24Bold => TextStyle(
    fontFamily: AppFonts.fontFamilySatoshi,
    fontSize: 24.sp,
    fontWeight: FontWeight.w700,
    height: 34 / 24,
  );

  // ---------------------------------------------------------------------------
  // Font Size 28  |  Line-height 40
  // ---------------------------------------------------------------------------
  static TextStyle get s28Regular => TextStyle(
    fontFamily: AppFonts.fontFamilySatoshi,
    fontSize: 28.sp,
    fontWeight: FontWeight.w400,
    height: 40 / 28,
  );

  static TextStyle get s28Medium => TextStyle(
    fontFamily: AppFonts.fontFamilySatoshi,
    fontSize: 28.sp,
    fontWeight: FontWeight.w500,
    height: 40 / 28,
  );

  static TextStyle get s28SemiBold => TextStyle(
    fontFamily: AppFonts.fontFamilySatoshi,
    fontSize: 28.sp,
    fontWeight: FontWeight.w600,
    height: 40 / 28,
  );

  static TextStyle get s28Bold => TextStyle(
    fontFamily: AppFonts.fontFamilySatoshi,
    fontSize: 28.sp,
    fontWeight: FontWeight.w700,
    height: 40 / 28,
  );

  // ---------------------------------------------------------------------------
  // Font Size 32  |  Line-height 44
  // ---------------------------------------------------------------------------
  static TextStyle get s32Regular => TextStyle(
    fontFamily: AppFonts.fontFamilySatoshi,
    fontSize: 32.sp,
    fontWeight: FontWeight.w400,
    height: 44 / 32,
  );

  static TextStyle get s32Medium => TextStyle(
    fontFamily: AppFonts.fontFamilySatoshi,
    fontSize: 32.sp,
    fontWeight: FontWeight.w500,
    height: 44 / 32,
  );

  static TextStyle get s32SemiBold => TextStyle(
    fontFamily: AppFonts.fontFamilySatoshi,
    fontSize: 32.sp,
    fontWeight: FontWeight.w600,
    height: 44 / 32,
  );

  static TextStyle get s32Bold => TextStyle(
    fontFamily: AppFonts.fontFamilySatoshi,
    fontSize: 32.sp,
    fontWeight: FontWeight.w700,
    height: 44 / 32,
  );

  // ---------------------------------------------------------------------------
  // Font Size 36  |  Line-height 50
  // ---------------------------------------------------------------------------
  static TextStyle get s36Regular => TextStyle(
    fontFamily: AppFonts.fontFamilySatoshi,
    fontSize: 36.sp,
    fontWeight: FontWeight.w400,
    height: 50 / 36,
  );

  static TextStyle get s36Medium => TextStyle(
    fontFamily: AppFonts.fontFamilySatoshi,
    fontSize: 36.sp,
    fontWeight: FontWeight.w500,
    height: 50 / 36,
  );

  static TextStyle get s36SemiBold => TextStyle(
    fontFamily: AppFonts.fontFamilySatoshi,
    fontSize: 36.sp,
    fontWeight: FontWeight.w600,
    height: 50 / 36,
  );

  static TextStyle get s36Bold => TextStyle(
    fontFamily: AppFonts.fontFamilySatoshi,
    fontSize: 36.sp,
    fontWeight: FontWeight.w700,
    height: 50 / 36,
  );
}
