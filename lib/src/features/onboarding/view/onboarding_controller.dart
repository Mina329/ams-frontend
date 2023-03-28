import 'dart:async';

import 'package:ams_frontend/src/features/onboarding/repo/onboarding_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OnboardingController extends AutoDisposeAsyncNotifier<bool> {
  Future<void> compeleteOnboading() async {
    final onboardingRepository = ref.watch(onboardingRepositoryProvider);
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      onboardingRepository.setOnboardingComplete();
      return onboardingRepository.isOnBoardingComplete();
    });
  }

  @override
  FutureOr<bool> build() {
    return ref.watch(onboardingRepositoryProvider).isOnBoardingComplete();
  }
}

final onboardingControllerProvider =
    AutoDisposeAsyncNotifierProvider<OnboardingController, bool>(
        OnboardingController.new);
