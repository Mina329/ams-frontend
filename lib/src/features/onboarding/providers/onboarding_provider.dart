import 'package:ams_frontend/src/features/onboarding/notifiers/onboarding_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final onboardingControllerProvider =
    AutoDisposeAsyncNotifierProvider<OnboardingNotifier, bool>(
        OnboardingNotifier.new);
