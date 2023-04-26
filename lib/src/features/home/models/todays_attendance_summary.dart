import 'package:ams_frontend/src/features/auth/models/models.dart';
import 'package:ams_frontend/src/features/subjects/models/models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'todays_attendance_summary.freezed.dart';

@freezed
class TodayAttendanceSummary with _$TodayAttendanceSummary {
  const factory TodayAttendanceSummary({
    required Subject subject,
    @Default([]) List<User> present,
    @Default([]) List<User> absent,
  }) = _TodayAttendanceSummary;
}
