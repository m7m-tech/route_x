import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/onboarding_item.dart';
import '../../domain/usecases/complete_onboarding_usecase.dart';
import '../../domain/usecases/get_onboarding_items_usecase.dart';

class OnboardingState {
  final int currentIndex;
  final List<OnboardingItem> items;
  final bool isCompleted;

  OnboardingState({
    required this.currentIndex,
    required this.items,
    this.isCompleted = false,
  });

  bool get isLastPage => items.isEmpty || currentIndex == items.length - 1;

  OnboardingState copyWith({
    int? currentIndex,
    List<OnboardingItem>? items,
    bool? isCompleted,
  }) {
    return OnboardingState(
      currentIndex: currentIndex ?? this.currentIndex,
      items: items ?? this.items,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}

class OnboardingCubit extends Cubit<OnboardingState> {
  final GetOnboardingItemsUseCase getOnboardingItemsUseCase;
  final CompleteOnboardingUseCase completeOnboardingUseCase;

  OnboardingCubit({
    required this.getOnboardingItemsUseCase,
    required this.completeOnboardingUseCase,
  }) : super(OnboardingState(
          currentIndex: 0,
          items: getOnboardingItemsUseCase(),
        ));

  void onPageChanged(int index) {
    emit(state.copyWith(currentIndex: index));
  }

  Future<void> finishOnboarding() async {
    await completeOnboardingUseCase();
    emit(state.copyWith(isCompleted: true));
  }
}
