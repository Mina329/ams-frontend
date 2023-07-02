import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'json_converters/time_of_day_converter.dart';

import 'dtos.dart';

part 'subject_dto.freezed.dart';
part 'subject_dto.g.dart';

@freezed
class SubjectDto with _$SubjectDto {
  const factory SubjectDto({
    required String id,
    required String name,
    UserDto? instructor,
    required DateTime createAt,
    required List<SubjectDateDto> dates,
    required DateTime updatedAt,
  }) = _SubjectDto;

  factory SubjectDto.fromJson(Map<String, Object?> json) =>
      _$SubjectDtoFromJson(json);
}

@freezed
class CreateSubjectDto with _$CreateSubjectDto {
  const factory CreateSubjectDto({
    required String name,
  }) = _CreateSubjectDto;

  factory CreateSubjectDto.fromJson(Map<String, Object?> json) =>
      _$CreateSubjectDtoFromJson(json);
}

@freezed
class UpdateSubjectDto with _$UpdateSubjectDto {
  const factory UpdateSubjectDto({
    String? name,
  }) = _UpdateSubjectDto;

  factory UpdateSubjectDto.fromJson(Map<String, Object?> json) =>
      _$UpdateSubjectDtoFromJson(json);
}

@freezed
class SubjectDateDto with _$SubjectDateDto {
  const factory SubjectDateDto({
    required DateTime createAt,
    required DateTime updatedAt,
    required String id,
    required int dayOfWeek,
    @TimeOfDayConverter() required TimeOfDay startTime,
    @TimeOfDayConverter() required TimeOfDay endTime,
  }) = _SubjectDateDto;

  factory SubjectDateDto.fromJson(Map<String, Object?> json) =>
      _$SubjectDateDtoFromJson(json);
}

@freezed
class CreateSubjectDateDto with _$CreateSubjectDateDto {
  const factory CreateSubjectDateDto({
    required int dayOfWeek,
    @TimeOfDayConverter() required TimeOfDay startTime,
    @TimeOfDayConverter() required TimeOfDay endTime,
  }) = _CreateSubjectDateDto;

  factory CreateSubjectDateDto.fromJson(Map<String, Object?> json) =>
      _$CreateSubjectDateDtoFromJson(json);
}
