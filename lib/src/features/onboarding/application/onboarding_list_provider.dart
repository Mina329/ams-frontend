import 'package:ams_frontend/src/features/onboarding/data/onboarding_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final onboardingListProvider = Provider((ref) {
  final onboardingRepository = ref.watch(onboardingRepositoryProvider);
  return onboardingRepository.list;
});
