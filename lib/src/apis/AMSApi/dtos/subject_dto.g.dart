// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subject_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SubjectDto _$$_SubjectDtoFromJson(Map<String, dynamic> json) =>
    _$_SubjectDto(
      id: json['id'] as String,
      name: json['name'] as String,
      instructor: UserDto.fromJson(json['instructor'] as Map<String, dynamic>),
      createAt: DateTime.parse(json['createAt'] as String),
      cronExpr: json['cronExpr'] as String,
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$_SubjectDtoToJson(_$_SubjectDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'instructor': instance.instructor,
      'createAt': instance.createAt.toIso8601String(),
      'cronExpr': instance.cronExpr,
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
