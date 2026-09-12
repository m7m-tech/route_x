// lib/core/widgets/routex_signup_progress.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:route_x/core/theme/app_colors.dart';
import 'package:route_x/core/theme/app_fonts.dart';

/// Numbered-node step progress indicator.
///
/// Renders [totalSteps] numbered circles connected by horizontal lines.
/// Steps â‰¤ [currentStep] are painted green (active/completed); steps beyond
/// [currentStep] are white with a grey border (pending).
///
/// ```dart
/// RouteXSignupProgress(currentStep: 1, totalSteps: 3)
/// ```
class RouteXSignupProgress extends StatelessWidget {
  const RouteXSignupProgress({
    super.key,
    required this.currentStep,
    this.totalSteps = 3,
  }) : assert(
         currentStep >= 1 && currentStep <= totalSteps,
         'currentStep must be between 1 and totalSteps (inclusive)',
       );

  /// The active step, 1-indexed.
  final int currentStep;

  /// Total number of steps. Defaults to 3.
  final int totalSteps;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (int step = 1; step <= totalSteps; step++) ...[
          // â”€â”€ A. Step circle â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
          _StepCircle(step: step, isActive: step <= currentStep),

          // â”€â”€ B. Connecting line (omitted after the last step) â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
          if (step < totalSteps)
            Expanded(child: _ConnectingLine(isCompleted: step < currentStep)),
        ],
      ],
    );
  }
}

// â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
// Private helpers
// â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€

/// A numbered circle step node.
class _StepCircle extends StatelessWidget {
  const _StepCircle({required this.step, required this.isActive});

  final int step;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      width: 36.w,
      height: 36.w,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive ? AppColors.mainGreen : AppColors.white,
        border: isActive
            ? null
            : Border.all(color: AppColors.emptyBarGray, width: 2.w),
      ),
      child: Center(
        child: Text(
          '$step',
          style: TextStyle(
            fontFamily: AppFonts.fontFamilySatoshi,
            fontSize: AppFonts.font16,
            fontWeight: FontWeight.w600,
            color: isActive
                ? AppColors.white
                : AppColors.secondaryTextGray,
          ),
        ),
      ),
    );
  }
}

/// The horizontal line between two step circles.
class _ConnectingLine extends StatelessWidget {
  const _ConnectingLine({required this.isCompleted});

  /// [true] when both the step before and after this line are completed.
  final bool isCompleted;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      height: 4.h,
      color: isCompleted
          ? AppColors.mainGreen
          : AppColors.emptyBarGray,
    );
  }
}
