import 'package:freezed_annotation/freezed_annotation.dart';

import '../../subjects/models/models.dart';

part 'todays_event.freezed.dart';

@freezed
class TodayEvent with _$TodayEvent {
  const factory TodayEvent({
    required DateTime date,
    @Default([]) List<Subject> subjects,
  }) = _TodayEvent;
}
