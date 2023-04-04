import 'package:ams_frontend/src/konstants/klocales.dart';
import 'package:ams_frontend/src/utils/extensions.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'settings_controller.freezed.dart';
part 'settings_controller.g.dart';

@freezed
class SettingsState with _$SettingsState {
  const factory SettingsState({
    required ThemeMode mode,
    required Locale locale,
    required FlexScheme scheme,
    required bool useMaterial3,
  }) = _SettingsState;

  factory SettingsState.initial() => SettingsState(
        mode: ThemeMode.dark,
        locale: KLocales.supported[0],
        scheme: FlexScheme.jungle,
        useMaterial3: false,
      );
}

@riverpod
class SettingsController extends _$SettingsController {
  @override
  SettingsState build() {
    return SettingsState.initial();
  }

  void toggleThemeMode() {
    state = state.copyWith(
      mode: state.mode.inverse,
    );
  }

  void changeLocale(Locale locale) {
    state = state.copyWith(locale: locale);
  }

  void changeThemeScheme(FlexScheme scheme) {
    state = state.copyWith(scheme: scheme);
  }

  void toggleMaterial3() {
    state = state.copyWith(useMaterial3: !state.useMaterial3);
  }
}
