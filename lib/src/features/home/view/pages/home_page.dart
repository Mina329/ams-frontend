import 'dart:math';

import 'package:ams_frontend/src/common/widgets/widgets.dart';
import 'package:ams_frontend/src/features/auth/view/controllers/auth_controller.dart';
import 'package:ams_frontend/src/konstants/konstants.dart';
import 'package:ams_frontend/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../../../../konstants/kcolors.dart';
import '../widgets/home_widget.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(authControllerProvider, (previous, next) {
      next.whenData((authState) => authState.whenOrNull(signed: (_) {
            context.toast(context.l10n.logginSuccess);
          }));
    });


    return Scaffold(
      appBar: AppBarWidget(
        icon: FontAwesomeIcons.house,
        title: context.l10n.homeTitle,
      ),
      drawer: const AppDrawerWidget(),
      body: Container(
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
          color: KColors.dark50Opacity,
          child: Padding(
            padding: const EdgeInsets.all(KPaddings.p20),
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: KSizes.s60,
                  child: Text(
                    context.l10n.todayAttendence,
                    style: TextStyle(
                      fontSize: KSizes.s25,
                      color: KColors.white,
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) => const TodayAttendanceCard(),
                    itemCount: 10,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
