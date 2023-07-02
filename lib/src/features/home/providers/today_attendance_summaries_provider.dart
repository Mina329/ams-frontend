import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:table_calendar/table_calendar.dart';

import 'package:ams_frontend/src/features/home/models/models.dart';
import 'package:ams_frontend/src/features/subjects/providers/providers.dart';

part 'today_attendance_summaries_provider.g.dart';

@riverpod
Future<List<TodayAttendanceSummary>> todayAttendanceSummaries(
  TodayAttendanceSummariesRef ref,
  String instructorId,
) async {
  final subjects = await ref.watch(userSubjectsProvider.future);

  List<TodayAttendanceSummary> summaries = [];

  for (var subject in subjects) {
    final attendances = await ref
        .watch(
          subjectAttendancesProvider(subject.id).future,
        )
        .then(
          (attendances) => attendances
              .where((a) => isSameDay(a.createAt, DateTime.now()))
              .toList(),
        );

    final enrolled = await ref.watch(
      subjectAttendeesProvider(subject.id).future,
    );

    final present = attendances.map((a) => a.attendee).toList();
    final absent = {...enrolled}.difference({...present}).toList();

    summaries.add(TodayAttendanceSummary(
      subject: subject,
      absent: absent,
      present: present,
    ));
  }

  return summaries;
}
