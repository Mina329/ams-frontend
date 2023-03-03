import 'dart:async';

import 'package:ams_frontend/src/features/onboarding/data/onboarding_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OnboardingController extends AutoDisposeAsyncNotifier {
  @override
  FutureOr build() {}

  Future<void> compeleteOnboading() async {
    final onboardingRepository = ref.watch(onboardingRepositoryProvider);
    state = const AsyncLoading();
    state = await AsyncValue.guard(onboardingRepository.setOnboardingComplete);
  }
}

final onboardingControllerProvider =
    AutoDisposeAsyncNotifierProvider<OnboardingController, void>(
        OnboardingController.new);
