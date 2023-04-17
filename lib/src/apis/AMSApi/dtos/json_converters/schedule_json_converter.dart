import 'package:cron/cron.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:easy_cron/easy_cron.dart';

final parser = UnixCronParser();

class ScheduleJsonConverter extends JsonConverter<CronSchedule, String> {
  const ScheduleJsonConverter();

  @override
  CronSchedule fromJson(String json) {
    final cron = Schedule.parse(json);
    return CronSchedule(
      minutes: cron.minutes?.toSet(),
      hours: cron.hours?.toSet(),
      daysOfWeek: cron.weekdays?.toSet(),
      months: cron.months?.toSet(),
      daysOfMonth: cron.days?.toSet(),
    );
  }

  @override
  String toJson(CronSchedule object) => object.toString();
}
