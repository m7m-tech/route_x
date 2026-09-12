import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Centralised font-family and font-size design tokens.
///
/// All sizes use `.sp` from [flutter_screenutil] for responsive scaling.
/// This class supplements [AppTextStyles] by providing raw `double` values
/// when only a size or family string is needed (e.g. within inline [TextStyle]
/// constructors that already set weight and color).
class AppFonts {
  AppFonts._(); // prevent instantiation

  /// Primary brand font family used across the entire application.
  static String fontFamilySatoshi = "Satoshi";

  /// 10 sp — caption / fine-print text.
  static double get font10 => 10.sp;

  /// 11 sp — small annotation text.
  static double get font11 => 11.sp;

  /// 12 sp — secondary helper text.
  static double get font12 => 12.sp;

  /// 14 sp — standard body text.
  static double get font14 => 14.sp;

  /// 16 sp — large body / button text.
  static double get font16 => 16.sp;

  /// 20 sp — sub-heading / section title.
  static double get font20 => 20.sp;

  /// 24 sp — heading text.
  static double get font24 => 24.sp;

  /// 28 sp — large heading text.
  static double get font28 => 28.sp;

  /// 32 sp — display / hero heading.
  static double get font32 => 32.sp;

  /// 36 sp — extra-large display text.
  static double get font36 => 36.sp;

  /// 48 sp — splash / banner headline.
  static double get font48 => 48.sp;
}
