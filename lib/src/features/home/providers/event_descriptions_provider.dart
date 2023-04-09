import 'package:ams_frontend/src/features/subjects/providers/providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'event_descriptions_provider.g.dart';

@riverpod
FutureOr<Map<DateTime, String>> eventDescriptions(
  EventDescriptionsRef ref, {
  required int limit,
}) async {
  final now = DateTime.now();

  final subjects = await ref.watch(userSubjectsProvider.future);
  final events = subjects.map(
    (subject) {
      List<DateTime> events = [];

      for (int i = 0; i < limit; i++) {
        final last = events.isNotEmpty ? events.last : now;
        events.add(subject.cronExpr.next(last).time);
      }

      return {for (var event in events) event: subject.name};
    },
  ).toList();

  final Map<DateTime, String> eventDescriptions = {};

  for (var event in events) {
    eventDescriptions.addAll(event);
  }

  return eventDescriptions;
}
