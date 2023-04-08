import 'package:ams_frontend/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../konstants/kcolors.dart';
import '../../../../konstants/kdoubles.dart';
import '../widgets/home_widget.dart';

class AttendeeHomePage extends StatelessWidget {
  AttendeeHomePage({Key? key, required this.eventDescriptions}) : super(key: key);
  Map<DateTime, String> eventDescriptions;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(KPaddings.p20),
      child: Column(
        children: [
          Text(
            context.l10n.subjectCalendar,
            style: TextStyle(
              fontSize: KSizes.s25,
              color: KColors.white,
            ),
          ),SizedBox(height: MediaQuery.of(context).size.height * KRatios.r004,),
          Calender(
            eventDescriptions: eventDescriptions,
          ),
        ],
      ),
    );;
  }
}
