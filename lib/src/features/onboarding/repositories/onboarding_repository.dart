import 'package:ams_frontend/src/assets/json_asset.dart';
import 'package:ams_frontend/src/common/providers/providers.dart';
import 'package:ams_frontend/src/features/onboarding/models/onboarding_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'onboarding_repository.g.dart';

class OnBoardingRepository {
  final SharedPreferences _sharedPreferences;

  OnBoardingRepository(this._sharedPreferences);

  static const String _onBoardingCompleteKey = 'onBoardingCompelete';

  Future<void> setOnboardingComplete() async {
    await _sharedPreferences.setBool(_onBoardingCompleteKey, true);
  }

  bool isOnBoardingComplete() {
    return _sharedPreferences.getBool(_onBoardingCompleteKey) ?? false;
  }

  static const _list = [
    OnboardingModel('title 1', 'onboarding 1', JsonAsset.onboarding1),
    OnboardingModel('title 2', 'onboarding 2', JsonAsset.onboarding2),
    OnboardingModel('title 3', 'onboarding 3', JsonAsset.onboarding3),
  ];

  List<OnboardingModel> get list => _list;
}

@riverpod
OnBoardingRepository onboardingRepository(OnboardingRepositoryRef ref) {
  return OnBoardingRepository(ref.watch(sharedPreferencesProvider));
}
