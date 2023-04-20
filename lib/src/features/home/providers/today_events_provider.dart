import 'package:ams_frontend/src/features/subjects/models/models.dart';
import 'package:ams_frontend/src/features/subjects/providers/providers.dart';
import 'package:ams_frontend/src/utils/utils.dart';
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
    final date = now.add(Duration(days: i));
    for (var subject in subjects) {
      if (subject.cronExpr.daysOfMonth?.contains(date.day) ?? false) {
        Utils.logger.wtf(subject.cronExpr.daysOfMonth);
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
