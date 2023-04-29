import 'package:ams_frontend/src/features/subjects/models/models.dart';
import 'package:ams_frontend/src/features/subjects/providers/providers.dart';
import 'package:cron/cron.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/todays_event.dart';

part 'today_events_provider.g.dart';

@riverpod
Future<List<TodayEvent>> todayEvents(
  TodayEventsRef ref, {
  required int limit,
}) async {
  List<TodayEvent> events = [];

  final subjects = await ref.watch(userSubjectsProvider.future);

  Map<DateTime, List<Subject>> map = {};

  final now = DateTime.now();

  for (int i = 0; i < limit; i++) {
    var date = now.add(Duration(days: i));
    for (var subject in subjects) {
      final cron = Schedule(
        hours: [for (var i = 0; i < 24; i++) i],
        seconds: [for (var i = 0; i < 60; i++) i],
        minutes: [for (var i = 0; i < 60; i++) i],
        days: subject.cronExpr.daysOfMonth?.toList(),
        months: subject.cronExpr.months?.toList(),
        weekdays: subject.cronExpr.daysOfWeek?.toList(),
      );

      if (cron.shouldRunAt(date)) {
        if (map[date] == null) map[date] = [];
        map[date] = [subject, ...?map[date]];
      }
    }
  }

  map.forEach((key, value) {
    events.add(TodayEvent(date: key, subjects: value));
  });

  return events;
}
