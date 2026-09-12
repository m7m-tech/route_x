import 'package:route_x/core/constants/app_assets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../domain/entities/onboarding_item.dart';
import '../../domain/repositories/onboarding_repository.dart';

class OnboardingRepositoryImpl implements OnboardingRepository {
  static const String _onboardingKey = 'has_completed_onboarding';

  @override
  List<OnboardingItem> getOnboardingItems() {
    return [
      const OnboardingItem(
        title: 'Deliver More. Drive Less.',
        description: 'Smarter routes, fewer miles.\nBetter results for your business.',
        image: AppAssets.onboardingGraphic1,
        highlightText: 'More.',
      ),
      // Add more pages here if needed
    ];
  }

  @override
  Future<void> completeOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_onboardingKey, true);
  }

  @override
  Future<bool> hasCompletedOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_onboardingKey) ?? false;
  }
}
