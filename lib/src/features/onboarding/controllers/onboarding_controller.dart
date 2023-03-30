import 'dart:async';

import 'package:ams_frontend/src/features/onboarding/models/onboarding_model.dart';
import 'package:ams_frontend/src/features/onboarding/repositories/onboarding_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'onboarding_controller.g.dart';
part 'onboarding_controller.freezed.dart';

// state
@freezed
class OnboardingState with _$OnboardingState {
  const factory OnboardingState.completed() = _Completed;
  const factory OnboardingState.notCompleted(List<OnboardingModel> list) =
      _NotCompleted;
}

// controller
@riverpod
class OnboardingConroller extends _$OnboardingConroller {
  Future<void> compeleteOnboading() async {
    final repo = ref.watch(onboardingRepositoryProvider);
    repo.setOnboardingComplete();
    state = const OnboardingState.completed();
  }

  @override
  OnboardingState build() {
    final repo = ref.watch(onboardingRepositoryProvider);
    return repo.isOnBoardingComplete()
        ? const OnboardingState.completed()
        : OnboardingState.notCompleted(repo.list);
  }
}
