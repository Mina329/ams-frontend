import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

extension AppLocaleExt on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this)!;
}

extension AsyncValueExt<T> on AsyncValue<T> {
  void whenDataOrReport(BuildContext context, String? Function(T) onData) {
    whenOrNull(
      data: (data) {
        String? message = onData(data);
        if (message != null) {
          _toast(context, message: message, level: ToastLevel.success);
        }
      },
      error: (error, stackTrace) {
        _toast(context, message: error.toString(), level: ToastLevel.error);
      },
    );
  }
}

enum ToastLevel {
  success,
  warning,
  error,
}

void _toast(
  BuildContext context, {
  required String message,
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

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      padding: const EdgeInsets.all(20.0),
      elevation: 20.0,
      margin: const EdgeInsets.all(20),
      behavior: SnackBarBehavior.floating,
      backgroundColor: colors[level.index],
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
      content: Center(
        heightFactor: double.minPositive,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icons[level.index], color: Colors.white),
            const SizedBox(width: 5),
            Text(
              message,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Colors.white,
                  ),
            ),
          ],
        ),
      ),
    ),
  );
}
