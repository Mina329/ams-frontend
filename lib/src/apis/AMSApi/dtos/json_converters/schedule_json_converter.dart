import 'package:ams_frontend/src/utils/utils.dart';
import 'package:cron/cron.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:easy_cron/easy_cron.dart';

final parser = UnixCronParser();

extension EasyCronExt on CronSchedule {
  Schedule into() => Schedule(
        seconds: seconds,
        hours: hours,
        days: daysOfMonth,
        weekdays: daysOfWeek,
        minutes: minutes,
        months: months,
      );
}

extension CronExt on Schedule {
  CronSchedule into() => CronSchedule(
        seconds: seconds?.toSet(),
        hours: hours?.toSet(),
        daysOfMonth: days?.toSet(),
        daysOfWeek: weekdays?.toSet(),
        minutes: minutes?.toSet(),
        months: months?.toSet(),
      );
}

class ScheduleJsonConverter extends JsonConverter<CronSchedule, String> {
  const ScheduleJsonConverter();

  @override
  CronSchedule fromJson(String json) {
    final cron = Schedule.parse('0 14 * * 1 *');
    Utils.logger.d(cron.hours);
    Utils.logger.d(cron.weekdays);
    return cron.into();
  }

  @override
  String toJson(CronSchedule object) => object.toString();
}
