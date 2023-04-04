import 'package:ams_frontend/src/features/settings/view/controllers/settings_controller.dart';
import 'package:ams_frontend/src/konstants/klocales.dart';
import 'package:ams_frontend/src/routing/routing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'common/theme.dart';

class MyApp extends ConsumerWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goRouter = ref.watch(goRouterProvider);
    final settingsState = ref.watch(settingsControllerProvider);
    return MaterialApp.router(
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: KLocales.supported,
      locale: settingsState.locale,
      theme: AppTheme.light(
        scheme: settingsState.scheme,
        useMaterial3: settingsState.useMaterial3,
      ),
      darkTheme: AppTheme.dark(
        scheme: settingsState.scheme,
        useMaterial3: settingsState.useMaterial3,
      ),
      themeMode: settingsState.mode,
      routerConfig: goRouter,
      debugShowCheckedModeBanner: false,
    );
  }
}
