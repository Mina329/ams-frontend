// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ApiUser _$ApiUserFromJson(Map<String, dynamic> json) {
  return _ApiUser.fromJson(json);
}

/// @nodoc
mixin _$ApiUser {
  String get id => throw _privateConstructorUsedError;
  int get number => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  DateTime get createAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ApiUserCopyWith<ApiUser> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiUserCopyWith<$Res> {
  factory $ApiUserCopyWith(ApiUser value, $Res Function(ApiUser) then) =
      _$ApiUserCopyWithImpl<$Res, ApiUser>;
  @useResult
  $Res call(
      {String id,
      int number,
      String name,
      String email,
      DateTime createAt,
      DateTime updatedAt});
}

/// @nodoc
class _$ApiUserCopyWithImpl<$Res, $Val extends ApiUser>
    implements $ApiUserCopyWith<$Res> {
  _$ApiUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? number = null,
    Object? name = null,
    Object? email = null,
    Object? createAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      number: null == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      createAt: null == createAt
          ? _value.createAt
          : createAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ApiUserCopyWith<$Res> implements $ApiUserCopyWith<$Res> {
  factory _$$_ApiUserCopyWith(
          _$_ApiUser value, $Res Function(_$_ApiUser) then) =
      __$$_ApiUserCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      int number,
      String name,
      String email,
      DateTime createAt,
      DateTime updatedAt});
}

/// @nodoc
class __$$_ApiUserCopyWithImpl<$Res>
    extends _$ApiUserCopyWithImpl<$Res, _$_ApiUser>
    implements _$$_ApiUserCopyWith<$Res> {
  __$$_ApiUserCopyWithImpl(_$_ApiUser _value, $Res Function(_$_ApiUser) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? number = null,
    Object? name = null,
    Object? email = null,
    Object? createAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$_ApiUser(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      number: null == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      createAt: null == createAt
          ? _value.createAt
          : createAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ApiUser implements _ApiUser {
  const _$_ApiUser(
      {required this.id,
      required this.number,
      required this.name,
      required this.email,
      required this.createAt,
      required this.updatedAt});

  factory _$_ApiUser.fromJson(Map<String, dynamic> json) =>
      _$$_ApiUserFromJson(json);

  @override
  final String id;
  @override
  final int number;
  @override
  final String name;
  @override
  final String email;
  @override
  final DateTime createAt;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'ApiUser(id: $id, number: $number, name: $name, email: $email, createAt: $createAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ApiUser &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.createAt, createAt) ||
                other.createAt == createAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, number, name, email, createAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ApiUserCopyWith<_$_ApiUser> get copyWith =>
      __$$_ApiUserCopyWithImpl<_$_ApiUser>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ApiUserToJson(
      this,
    );
  }
}

abstract class _ApiUser implements ApiUser {
  const factory _ApiUser(
      {required final String id,
      required final int number,
      required final String name,
      required final String email,
      required final DateTime createAt,
      required final DateTime updatedAt}) = _$_ApiUser;

  factory _ApiUser.fromJson(Map<String, dynamic> json) = _$_ApiUser.fromJson;

  @override
  String get id;
  @override
  int get number;
  @override
  String get name;
  @override
  String get email;
  @override
  DateTime get createAt;
  @override
  DateTime get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$_ApiUserCopyWith<_$_ApiUser> get copyWith =>
      throw _privateConstructorUsedError;
}
