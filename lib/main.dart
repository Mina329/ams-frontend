import 'package:ams_frontend/src/core/provider_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: depend_on_referenced_packages
import 'package:flutter_web_plugins/url_strategy.dart';

import 'src/app.dart';
import 'src/common/providers/providers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized;
  usePathUrlStrategy();
  runApp(ProviderScope(
    overrides: [
      sharedPreferencesProvider.overrideWithValue(
        await SharedPreferences.getInstance(),
      )
    ],
    observers: [LoggerObserver()],
    child: const MyApp(),
  ));
}
