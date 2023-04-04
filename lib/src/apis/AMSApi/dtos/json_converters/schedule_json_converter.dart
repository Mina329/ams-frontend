import 'package:ams_frontend/src/utils/utils.dart';
import 'package:cron/cron.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class ScheduleJsonConverter extends JsonConverter<Schedule, String> {
  const ScheduleJsonConverter();

  @override
  Schedule fromJson(String json) => Schedule.parse(json);

  @override
  String toJson(Schedule object) => object.toExprString();
}
