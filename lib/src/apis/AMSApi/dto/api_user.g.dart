// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ApiUser _$$_ApiUserFromJson(Map<String, dynamic> json) => _$_ApiUser(
      id: json['id'] as String,
      number: json['number'] as int,
      name: json['name'] as String,
      email: json['email'] as String,
      createAt: DateTime.parse(json['createAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$_ApiUserToJson(_$_ApiUser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'number': instance.number,
      'name': instance.name,
      'email': instance.email,
      'createAt': instance.createAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
