import '../entities/onboarding_item.dart';
import '../repositories/onboarding_repository.dart';

class GetOnboardingItemsUseCase {
  final OnboardingRepository repository;

  const GetOnboardingItemsUseCase({required this.repository});

  List<OnboardingItem> call() {
    return repository.getOnboardingItems();
  }
}
