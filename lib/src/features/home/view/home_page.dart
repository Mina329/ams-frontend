import 'package:ams_frontend/src/common/widgets/widgets.dart';
import 'package:ams_frontend/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        icon: FontAwesomeIcons.house,
        title: context.l10n.homeTitle,
      ),
      drawer: const AppDrawerWidget(),
      body: const Center(
        child: Text('home'),
      ),
    );
  }
}
