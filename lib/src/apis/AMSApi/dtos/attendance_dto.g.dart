// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendance_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AttendanceDto _$$_AttendanceDtoFromJson(Map<String, dynamic> json) =>
    _$_AttendanceDto(
      id: json['id'] as String,
      attendee: UserDto.fromJson(json['attendee'] as Map<String, dynamic>),
      subject: SubjectDto.fromJson(json['subject'] as Map<String, dynamic>),
      createAt: DateTime.parse(json['createAt'] as String),
    );

Map<String, dynamic> _$$_AttendanceDtoToJson(_$_AttendanceDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'attendee': instance.attendee,
      'subject': instance.subject,
      'createAt': instance.createAt.toIso8601String(),
    };
