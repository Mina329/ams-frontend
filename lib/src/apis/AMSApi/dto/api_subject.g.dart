// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_subject.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ApiSubject _$$_ApiSubjectFromJson(Map<String, dynamic> json) =>
    _$_ApiSubject(
      id: json['id'] as String,
      name: json['name'] as String,
      instructor: ApiUser.fromJson(json['instructor'] as Map<String, dynamic>),
      createAt: DateTime.parse(json['createAt'] as String),
      cronExpr: json['cronExpr'] as String,
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$_ApiSubjectToJson(_$_ApiSubject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'instructor': instance.instructor,
      'createAt': instance.createAt.toIso8601String(),
      'cronExpr': instance.cronExpr,
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
