import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Design token spacing and border radius values exported from Figma.
///
/// [AppSpacing] – Primitive spacing values & layout grid tokens.
/// [AppRadius] – Border radius tokens from the Spacing/borderRadius section.
///
/// All values use [flutter_screenutil] extensions for responsive scaling.
class AppSpacing {
  AppSpacing._();

  // ---------------------------------------------------------------------------
  // Primitive Spacing
  // ---------------------------------------------------------------------------
  static double get spacing0 => 0.w;
  static double get spacing2 => 2.w;
  static double get spacing4 => 4.w;
  static double get spacing8 => 8.w;
  static double get spacing12 => 12.w;
  static double get spacing16 => 16.w;
  static double get spacing20 => 20.w;
  static double get spacing24 => 24.w;
  static double get spacing32 => 32.w;
  static double get spacing40 => 40.w;
  static double get spacing56 => 56.w;

  // Height / Vertical Spacing Aliases (.h)
  static double get h0 => 0.h;
  static double get h2 => 2.h;
  static double get h4 => 4.h;
  static double get h8 => 8.h;
  static double get h12 => 12.h;
  static double get h16 => 16.h;
  static double get h20 => 20.h;
  static double get h24 => 24.h;
  static double get h32 => 32.h;
  static double get h40 => 40.h;
  static double get h56 => 56.h;

  // Width / Horizontal Spacing Aliases (.w)
  static double get w0 => 0.w;
  static double get w2 => 2.w;
  static double get w4 => 4.w;
  static double get w8 => 8.w;
  static double get w12 => 12.w;
  static double get w16 => 16.w;
  static double get w20 => 20.w;
  static double get w24 => 24.w;
  static double get w32 => 32.w;
  static double get w40 => 40.w;
  static double get w56 => 56.w;

  // Short Spacing Aliases (s)
  static double get s0 => spacing0;
  static double get s2 => spacing2;
  static double get s4 => spacing4;
  static double get s8 => spacing8;
  static double get s12 => spacing12;
  static double get s16 => spacing16;
  static double get s20 => spacing20;
  static double get s24 => spacing24;
  static double get s32 => spacing32;
  static double get s40 => spacing40;
  static double get s56 => spacing56;

  // ---------------------------------------------------------------------------
  // Layout Grid
  // ---------------------------------------------------------------------------
  static double get layoutGridWidth => 402.w;
  static int get layoutGridColumns => 4;
  static double get layoutGridMargins => 16.w;
  static double get layoutGridGap => 12.w;
  static double get layoutGridGutters => 16.w;
  static double get layoutGridPadding => 8.w;
}

/// Border radius tokens from Figma.
///
/// Values use `.r` from [flutter_screenutil] for uniform responsive scaling.
class AppRadius {
  AppRadius._();

  static double get radius0 => 0.r;
  static double get radius2 => 2.r;
  static double get radius4 => 4.r;
  static double get radius8 => 8.r;
  static double get radius12 => 12.r;
  static double get radius16 => 16.r;
  static double get radius20 => 20.r;
  static double get radius24 => 24.r;
  static double get radius32 => 32.r;
  static double get radius40 => 40.r;
  static double get radius56 => 56.r;
  static double get radius64 => 64.r;

  // Short Radius Aliases (r)
  static double get r0 => radius0;
  static double get r2 => radius2;
  static double get r4 => radius4;
  static double get r8 => radius8;
  static double get r12 => radius12;
  static double get r16 => radius16;
  static double get r20 => radius20;
  static double get r24 => radius24;
  static double get r32 => radius32;
  static double get r40 => radius40;
  static double get r56 => radius56;
  static double get r64 => radius64;
}
