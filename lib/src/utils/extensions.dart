import 'package:ams_frontend/src/konstants/kdoubles.dart';
import 'package:ams_frontend/src/konstants/kints.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:cron/cron.dart';
import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

extension ThemeModeExt on ThemeMode {
  IconData get icon => this == ThemeMode.dark
      ? Icons.dark_mode_outlined
      : Icons.light_mode_outlined;

  ThemeMode get inverse =>
      this == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
}

extension ScheduleToString on Schedule {
  String toHumanString() {
    // todo
    throw UnimplementedError();
  }

  String toExprString() {
    final minutes = this.minutes?.map((e) => '$e').join(',') ?? '';
    final hours = this.hours?.map((e) => '$e').join(',');
    final days = this.days?.map((e) => '$e').join(',');
    final months = this.months?.map((e) => '$e').join(',');
    final weekdays = this.weekdays?.map((e) => '$e').join(',');

    return '$minutes $hours $days $months $weekdays';
  }
}

extension AppLocaleExt on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this)!;
}

extension StringHardCodedExt on String {
  String get hardcoded => this;
}

extension AsyncValueExt<T> on AsyncValue<T> {
  void maybeDataAndReport(
    BuildContext context,
    void Function(T)? onData,
  ) {
    whenOrNull(
      data: onData != null
          ? (data) {
              onData(data);
            }
          : null,
      error: (error, stackTrace) {
        context.toast(error.toString(), level: ToastLevel.error);
      },
    );
  }
}

enum ToastLevel {
  success,
  warning,
  error,
}

extension ToastExt on BuildContext {
  void toast(
    String message, {
    ToastLevel level = ToastLevel.success,
  }) {
    const List<Color> colors = [
      Colors.green,
      Colors.orange,
      Colors.red,
    ];

    const List<IconData> icons = [
      Icons.message_outlined,
      Icons.warning_amber_outlined,
      Icons.error_outline,
    ];

    final color = colors[level.index];
    final icon = icons[level.index];

    Flushbar(
      title: level.name,
      titleColor: color,
      message: message,
      messageColor: color,
      flushbarPosition: FlushbarPosition.BOTTOM,
      flushbarStyle: FlushbarStyle.FLOATING,
      reverseAnimationCurve: Curves.decelerate,
      forwardAnimationCurve: Curves.elasticOut,
      duration: const Duration(seconds: KDurations.milli500 * 8),
      icon: Icon(
        icon,
        color: color,
      ),
      leftBarIndicatorColor: color,
      backgroundColor: color.withAlpha(30),
      margin: const EdgeInsets.all(KSizes.s10),
      borderRadius: BorderRadius.circular(KSizes.s10),
    ).show(this);
  }
}
