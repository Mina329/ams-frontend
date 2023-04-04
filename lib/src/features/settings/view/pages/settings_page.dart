import 'package:ams_frontend/src/common/common.dart';
import 'package:ams_frontend/src/features/settings/view/controllers/settings_controller.dart';
import 'package:ams_frontend/src/konstants/klocales.dart';
import 'package:ams_frontend/src/utils/extensions.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:settings_ui/settings_ui.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settingsState = ref.watch(settingsControllerProvider);

    return Scaffold(
      appBar: AppBarWidget(
        title: context.l10n.settingsTitle,
        icon: Icons.settings,
      ),
      drawer: const AppDrawerWidget(),
      body: SettingsList(
        sections: [
          SettingsSection(
            title: const Text('appearance'),
            tiles: [
              SettingsTile.switchTile(
                onToggle: (_) {
                  ref
                      .read(settingsControllerProvider.notifier)
                      .toggleThemeMode();
                },
                initialValue: settingsState.mode == ThemeMode.light,
                leading: const Icon(Icons.sunny_snowing),
                title: const Text('mode'),
                trailing: Icon(settingsState.mode.icon),
              ),
              SettingsTile.navigation(
                leading: const Icon(Icons.theater_comedy_outlined),
                title: const Text('color scheme'),
                trailing: DropdownButton(
                  icon: const Icon(Icons.arrow_downward_rounded),
                  value: settingsState.scheme,
                  items: [
                    for (var scheme in FlexScheme.values)
                      DropdownMenuItem(
                        value: scheme,
                        child: Text(scheme.name),
                        onTap: () {
                          ref
                              .read(settingsControllerProvider.notifier)
                              .changeThemeScheme(scheme);
                        },
                      ),
                  ],
                  onChanged: (_) {},
                ),
              ),
              SettingsTile.switchTile(
                initialValue: settingsState.useMaterial3,
                onToggle: (_) {
                  ref
                      .read(settingsControllerProvider.notifier)
                      .toggleMaterial3();
                },
                leading: const Icon(Icons.interests_rounded),
                title: const Text('Enable Material 3'),
              )
            ],
          ),
          SettingsSection(
            title: const Text('Localization'),
            tiles: [
              SettingsTile.navigation(
                leading: const Icon(Icons.language),
                title: const Text('Language'),
                trailing: DropdownButton(
                  icon: const Icon(Icons.arrow_downward_rounded),
                  value: settingsState.locale,
                  items: [
                    for (var locale in KLocales.supported)
                      DropdownMenuItem(
                        value: locale,
                        child: Text(locale.toLanguageTag()),
                        onTap: () {
                          ref
                              .read(settingsControllerProvider.notifier)
                              .changeLocale(locale);
                        },
                      ),
                  ],
                  onChanged: (_) {},
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
