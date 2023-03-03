import 'package:ams_frontend/src/core/providers.dart';
import 'package:ams_frontend/src/features/onboarding/data/onboarding_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'src/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized;
  usePathUrlStrategy();
  runApp(ProviderScope(
    overrides: [
      onboardingRepositoryProvider.overrideWithValue(
        OnBoardingRepository(await SharedPreferences.getInstance()),
      )
    ],
    observers: [Logger()],
    child: const MyApp(),
  ));
}
