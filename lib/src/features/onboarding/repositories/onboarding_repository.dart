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
    Onboarding('Attendance app', 'Track Your Attendance', JsonAsset.onboarding1),
    Onboarding('Face recognition', 'Take Attendance With Face ID', JsonAsset.onboarding2),
    Onboarding('Reports', 'Generate Reports For Your Attendance', JsonAsset.onboarding3),
  ];

  List<Onboarding> get list => _list;
}

@riverpod
OnBoardingRepository onboardingRepository(OnboardingRepositoryRef ref) {
  return OnBoardingRepository(ref.watch(sharedPreferencesProvider));
}
