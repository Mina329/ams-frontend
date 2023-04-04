import 'package:ams_frontend/src/konstants/kdoubles.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends AppBar {
  AppBarWidget(
      {super.key,
      required String title,
      required IconData icon,
      List<Widget> actions = const []})
      : super(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon),
              const SizedBox(width: KSizes.s10),
              Text(title),
            ],
          ),
          centerTitle: true,
          elevation: KElevations.e20,
          actions: actions,
        );
}
