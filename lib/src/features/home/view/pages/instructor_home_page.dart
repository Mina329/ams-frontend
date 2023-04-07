import 'package:ams_frontend/src/utils/extensions.dart';
import 'package:flutter/material.dart';

import '../../../../konstants/kcolors.dart';
import '../../../../konstants/kdoubles.dart';
import '../widgets/home_widget.dart';

class InstructorHomePage extends StatelessWidget {
  const InstructorHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
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
              itemBuilder: (context,
                  index) => const TodayAttendanceCard(),
              itemCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}
