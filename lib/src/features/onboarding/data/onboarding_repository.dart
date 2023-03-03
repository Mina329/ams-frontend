import 'package:ams_frontend/src/assets/json_asset.dart';
import 'package:ams_frontend/src/features/onboarding/domain/onboarding.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    Onboarding('title 1', 'onboarding 1', JsonAsset.onboarding1),
    Onboarding('title 2', 'onboarding 2', JsonAsset.onboarding2),
    Onboarding('title 3', 'onboarding 3', JsonAsset.onboarding3),
  ];

  List<Onboarding> get list => _list;
}

final onboardingRepositoryProvider = Provider<OnBoardingRepository>((ref) {
  throw UnimplementedError();
});
