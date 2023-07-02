import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:intl/intl.dart';

class TimeOfDayConverter implements JsonConverter<TimeOfDay, String> {
  const TimeOfDayConverter();

  @override
  TimeOfDay fromJson(String json) {
    final dateFormater = DateFormat("H:M:S");
    return TimeOfDay.fromDateTime(dateFormater.parse(json));
  }

  @override
  String toJson(TimeOfDay object) {
    return '${object.hour.toString().padLeft(2)}:${object.minute.toString().padLeft(2)}:00';
  }
}
