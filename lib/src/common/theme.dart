import 'package:ams_frontend/src/konstants/konstants.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData dark = ThemeData(
    primaryColor: KColors.lightCyan,
    secondaryHeaderColor: KColors.purple,
    appBarTheme: AppBarTheme(color: KColors.lightCyan),
    scaffoldBackgroundColor: KColors.darkCyan,
  );

  static ThemeData light = ThemeData(
    primaryColor: KColors.lightCyan,
    secondaryHeaderColor: KColors.purple,
    appBarTheme: AppBarTheme(color: KColors.lightCyan),
    scaffoldBackgroundColor: KColors.darkCyan,
  );
}
