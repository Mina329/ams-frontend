import 'package:ams_frontend/src/common/common.dart';
import 'package:ams_frontend/src/features/home/models/todays_event.dart';
import 'package:ams_frontend/src/features/home/providers/today_events_provider.dart';
import 'package:ams_frontend/src/konstants/konstants.dart';
import 'package:ams_frontend/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widgets/home_widget.dart';

class AttendeeHomePage extends ConsumerWidget {
  const AttendeeHomePage(this.attendeeId, {Key? key}) : super(key: key);

  final String attendeeId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          context.l10n.subjectCalendar,
          style: TextStyle(
            fontSize: KSizes.s25,
            color: KColors.white,
          ),
        ),
        GenericAsyncBuilder(
          withRefreshIndicator: true,
          provider: todayEventsProvider(limit: 10),
          data: (List<TodayEvent> events) => Calender(events),
        ),
        TextButton(
            onPressed: () {
              ref.invalidate(todayEventsProvider(limit: 10));
            },
            child: const Text('refresh')),
      ],
    );
  }
}
