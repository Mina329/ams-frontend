import 'package:ams_frontend/src/common/common.dart';
import 'package:ams_frontend/src/features/settings/view/controllers/settings_controller.dart';
import 'package:ams_frontend/src/konstants/konstants.dart';
import 'package:ams_frontend/src/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:settings_ui/settings_ui.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settingsState = ref.watch(settingsControllerProvider);
    final settingsThemeData = SettingsThemeData(
      settingsListBackground: Colors.transparent.withAlpha(KAlphas.a100),
      titleTextColor: KColors.white,
      tileDescriptionTextColor: KColors.lightCyan,
      settingsTileTextColor: KColors.white,
      trailingTextColor: KColors.white,
      leadingIconsColor: KColors.white,
      dividerColor: KColors.white,
      inactiveSubtitleColor: KColors.white,
      inactiveTitleColor: KColors.white,
      settingsSectionBackground: KColors.lightCyan.withAlpha(KAlphas.a50),
      tileHighlightColor: KColors.white,
    );

    void onThemeModeToggle(bool _) =>
        ref.read(settingsControllerProvider.notifier).toggleThemeMode();

    void onUseMaterial3Toggle(bool _) =>
        ref.read(settingsControllerProvider.notifier).toggleMaterial3();

    void onLocaleChange(Locale? locale) {
      if (locale != null) {
        ref.read(settingsControllerProvider.notifier).changeLocale(locale);
      }
    }

    return Scaffold(
      appBar: AppBarWidget(
        title: context.l10n.settingsTitle,
        icon: Icons.settings,
      ),
      drawer: const AppDrawerWidget(),
      body: Container(
        padding: const EdgeInsets.all(KPaddings.p20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              KColors.gradiant1,
              KColors.gradiant2,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: KColors.dark50Opacity,
            borderRadius: BorderRadius.circular(KRadiuses.r50),
          ),
          child: SettingsList(
            darkTheme: settingsThemeData,
            lightTheme: settingsThemeData,
            sections: [
              SettingsSection(
                title: Text(context.l10n.appearance),
                tiles: [
                  SettingsTile.switchTile(
                    onToggle: onThemeModeToggle,
                    initialValue: settingsState.mode == ThemeMode.light,
                    leading: const Icon(Icons.sunny_snowing),
                    title: Text(context.l10n.themeMode),
                    description: Text(settingsState.mode.l10n(context)),
                    trailing: Icon(
                      settingsState.mode.icon,
                      color: KColors.white,
                    ),
                  ),
                  SettingsTile.switchTile(
                    activeSwitchColor: KColors.lightCyan,
                    initialValue: settingsState.useMaterial3,
                    onToggle: onUseMaterial3Toggle,
                    leading: Icon(
                      KIcons.enableMaterial3,
                      color: KColors.white,
                    ),
                    title: Text('Enable Material 3'.hardcoded),
                  )
                ],
              ),
              SettingsSection(
                title: Text(context.l10n.language),
                tiles: [
                  SettingsTile.navigation(
                    leading: const Icon(Icons.language),
                    title: Text(context.l10n.langValue),
                    trailing: DropdownButton(
                      borderRadius: BorderRadius.circular(KRadiuses.r10),
                      dropdownColor: KColors.lightCyan,
                      icon: Icon(
                        Icons.arrow_downward_rounded,
                        color: KColors.white,
                      ),
                      value: settingsState.locale,
                      items: [
                        for (var locale in KLocales.supported)
                          DropdownMenuItem(
                            value: locale,
                            child: Text(
                              locale.toLanguageTag(),
                              style: TextStyle(color: KColors.white),
                            ),
                          ),
                      ],
                      onChanged: onLocaleChange,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
