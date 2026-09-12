// lib/core/widgets/routex_language_toggle.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:route_x/core/bloc/language/language_bloc.dart';
import 'package:route_x/core/theme/app_colors.dart';
import 'package:route_x/core/theme/app_fonts.dart';

/// A compact, animated toggle button that switches the app locale between
/// English (`en`) and Arabic (`ar`) by dispatching [ToggleLanguageEvent]
/// to the global [LanguageBloc].
///
/// Drop this anywhere in the widget tree â€” no additional setup needed
/// because [LanguageBloc] is already provided at the root in `main.dart`.
///
/// ```dart
/// const RouteXLanguageToggle()
/// ```
class RouteXLanguageToggle extends StatelessWidget {
  const RouteXLanguageToggle({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageBloc, LanguageState>(
      builder: (context, state) {
        final bool isEnglish = state.languageCode == 'en';

        return GestureDetector(
          // â”€â”€ Tap: fire toggle after a 200 ms ripple delay â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€
          onTap: () {
            Future.delayed(const Duration(milliseconds: 200), () {
              if (context.mounted) {
                context.read<LanguageBloc>().add(ToggleLanguageEvent());
              }
            });
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut,
            width: 40.h,
            height: 40.h,
            decoration: BoxDecoration(
              color: AppColors.mainGreen,
              borderRadius: BorderRadius.circular(10.r),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 6,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Center(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 200),
                // Scale transition â€” exact legacy animation preserved
                transitionBuilder: (child, animation) =>
                    ScaleTransition(scale: animation, child: child),
                child: Text(
                  isEnglish ? 'En' : 'Ø¹',
                  // ValueKey forces AnimatedSwitcher to detect a child swap
                  key: ValueKey<bool>(isEnglish),
                  style: TextStyle(
                    fontFamily: AppFonts.fontFamilySatoshi,
                    fontSize: AppFonts.font14,
                    fontWeight: FontWeight.w700,
                    color: AppColors.white,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
