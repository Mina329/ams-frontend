import 'package:ams_frontend/src/apis/AMSApi/ams_api.dart';
import 'package:ams_frontend/src/features/auth/models/user_model.dart';
import 'package:easy_cron/easy_cron.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'subject_model.freezed.dart';

@freezed
class Subject with _$Subject {
  const factory Subject({
    required String id,
    required String name,
    required User? instructor,
    required DateTime createAt,
    required List<SubjectDate> dates,
    required DateTime updatedAt,
  }) = _Subject;
}

@freezed
class SubjectDate with _$SubjectDate {
  const factory SubjectDate({
    required String id,
    required DayOfWeek dayOfWeek,
    required TimeOfDay startTime,
    required TimeOfDay endTime,
    required DateTime createAt,
    required DateTime updatedAt,
  }) = _SubjectDate;
}

extension IntoSubjectDate on SubjectDateDto {
  SubjectDate intoSubjectDate() => SubjectDate(
        createAt: createAt,
        id: id,
        startTime: startTime,
        endTime: endTime,
        dayOfWeek: DayOfWeek.values[dayOfWeek],
        updatedAt: updatedAt,
      );
}

extension IntoSubject on SubjectDto {
  Subject intoSubject() => Subject(
        id: id,
        name: name,
        instructor: instructor?.intoUser(UserType.instructor),
        createAt: createAt,
        dates: dates.map((e) => e.intoSubjectDate()).toList(),
        updatedAt: updatedAt,
      );
}

enum DayOfWeek {
  saturday,
  sunday,
  monday,
  tuesday,
  wednesday,
  thusday,
  friday;

  bool isSameAs(DateTime dateTime) {
    return index == dateTime.weekday - 1;
  }
}
