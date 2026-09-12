import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:route_x/core/constants/app_assets.dart';
import 'package:route_x/core/di/injection.dart';
import 'package:route_x/core/l10n/app_localizations.dart';
import 'package:route_x/core/router/app_routes.dart';
import 'package:route_x/core/theme/app_colors.dart';
import 'package:route_x/core/theme/app_text_styles.dart';
import '../../domain/entities/onboarding_item.dart';
import '../bloc/onboarding_cubit.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<OnboardingCubit>(),
      child: const OnboardingView(),
    );
  }
}

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      backgroundColor: AppColors.white,
      body: BlocConsumer<OnboardingCubit, OnboardingState>(
        listener: (context, state) {
          if (state.isCompleted) {
            Navigator.pushReplacementNamed(
              context,
              AppRoutes.driverLoginScreen,
            );
          }
        },
        builder: (context, state) {
          return SafeArea(
            top: false,
            bottom: false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ── Progress bar: top 94, height 25 (bottom 798) ──────────────
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 26.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 94.h),
                      _buildPageIndicators(
                        state.items.length,
                        state.currentIndex,
                      ),
                      // Gap down to the Hero Frame top (155): 155 - 94 - 6 = 55.
                      SizedBox(height: 55.h),
                      _buildLogo(),
                    ],
                  ),
                ),
                // Gap between the logo and the headline inside the Hero Frame.
                SizedBox(height: 16.h),
                Expanded(
                  // Full-bleed page area — the hero graphic spans edge-to-edge per
                  // the Figma spec (Group 2: 412x355), so no horizontal padding here.
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: state.items.length,
                    onPageChanged: (index) {
                      context.read<OnboardingCubit>().onPageChanged(index);
                    },
                    itemBuilder: (context, index) {
                      final item = state.items[index];
                      return _buildPageContent(context, item, index, l10n);
                    },
                  ),
                ),
                // ── Get Started button: top 785, w360 h56, bottom 76 ──────────
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 26.w),
                  child: Column(
                    children: [
                      // Gap between the hero graphic bottom (753) and button top (785).
                      SizedBox(height: 32.h),
                      _buildGetStartedButton(context, state, l10n),
                      SizedBox(height: 76.h),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  /// "RouteX" wordmark logo — matches the 24 sp text height it replaced.
  Widget _buildLogo() {
    return SvgPicture.asset(AppAssets.logo, height: 24.h);
  }

  Widget _buildPageIndicators(int count, int currentIndex) {
    // The indicator always shows at least 2 segments per the design, even
    // while only one onboarding page has content — the rest render inactive.
    final segmentCount = count < 2 ? 2 : count;

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: List.generate(segmentCount, (index) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          margin: EdgeInsets.only(left: 8.w),
          width: 72.w,
          height: 6.h,
          decoration: BoxDecoration(
            color: index == currentIndex
                ? AppColors.mainGreen
                : AppColors.gray200,
            borderRadius: BorderRadius.circular(10.r),
          ),
        );
      }),
    );
  }

  Widget _buildPageContent(
    BuildContext context,
    OnboardingItem item,
    int index,
    AppLocalizations? l10n,
  ) {
    // Fixed, non-scrollable layout. Wrapped in a disabled ScrollView (not a
    // plain Column) purely so sub-pixel rounding from the .h/.w conversions
    // can never trip Flutter's debug overflow banner — the user still can't
    // scroll or feel any movement.
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 26.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeading(item, index, l10n),
                SizedBox(height: 16.h),
                Text(
                  index == 0 && l10n != null
                      ? l10n.onboardingSubheadline
                      : item.description,
                  style: AppTextStyles.s16Regular.copyWith(
                    color: AppColors.primaryBlack,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
          // Gap between the Hero Frame bottom (366) and the graphic top (398).
          SizedBox(height: 32.h),
          // Hero graphic — full-bleed edge-to-edge per Figma (412x355).
          // AspectRatio (not a fixed .h height) keeps the crop true to the
          // source art regardless of the device's own screen proportions.
          AspectRatio(
            aspectRatio: 412 / 355,
            child: Image.asset(
              item.image,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeading(OnboardingItem item, int index, AppLocalizations? l10n) {
    if (index == 0 && l10n != null) {
      return RichText(
        text: TextSpan(
          style: AppTextStyles.s36Bold.copyWith(
            color: AppColors.primaryBlack,
            fontSize: 48.sp,
            fontWeight: FontWeight.w900,
            height: 1.15,
          ),
          children: [
            TextSpan(text: l10n.onboardingHeadline1),
            TextSpan(
              text: l10n.onboardingHeadline2,
              style: const TextStyle(color: AppColors.mainGreen),
            ),
            TextSpan(text: l10n.onboardingHeadline3),
            TextSpan(
              text: l10n.onboardingHeadline4,
              style: const TextStyle(color: AppColors.mainGreen),
            ),
          ],
        ),
      );
    }

    return Text(
      item.title,
      style: AppTextStyles.s36Bold.copyWith(
        color: AppColors.primaryBlack,
        fontSize: 48.sp,
        fontWeight: FontWeight.w900,
        height: 1.15,
      ),
    );
  }

  Widget _buildGetStartedButton(
    BuildContext context,
    OnboardingState state,
    AppLocalizations? l10n,
  ) {
    final buttonText = l10n?.getStarted ?? 'Get Started';

    return SizedBox(
      width: double.infinity,
      height: 56.h,
      child: ElevatedButton(
        onPressed: () {
          if (state.isLastPage) {
            context.read<OnboardingCubit>().finishOnboarding();
          } else {
            _pageController.nextPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.mainGreen,
          foregroundColor: Colors.black,
          padding: EdgeInsets.all(8.r),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.r),
          ),
          elevation: 0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              buttonText,
              style: AppTextStyles.s16Bold.copyWith(color: Colors.black),
            ),
            SizedBox(width: 12.w),
            Icon(Icons.arrow_forward, size: 20.sp, color: Colors.black),
          ],
        ),
      ),
    );
  }
}
