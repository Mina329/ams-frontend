// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'attendance_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AttendanceDto _$AttendanceDtoFromJson(Map<String, dynamic> json) {
  return _AttendanceDto.fromJson(json);
}

/// @nodoc
mixin _$AttendanceDto {
  String get id => throw _privateConstructorUsedError;
  UserDto get attendee => throw _privateConstructorUsedError;
  SubjectDto get subject => throw _privateConstructorUsedError;
  DateTime get createAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AttendanceDtoCopyWith<AttendanceDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AttendanceDtoCopyWith<$Res> {
  factory $AttendanceDtoCopyWith(
          AttendanceDto value, $Res Function(AttendanceDto) then) =
      _$AttendanceDtoCopyWithImpl<$Res, AttendanceDto>;
  @useResult
  $Res call(
      {String id, UserDto attendee, SubjectDto subject, DateTime createAt});

  $UserDtoCopyWith<$Res> get attendee;
  $SubjectDtoCopyWith<$Res> get subject;
}

/// @nodoc
class _$AttendanceDtoCopyWithImpl<$Res, $Val extends AttendanceDto>
    implements $AttendanceDtoCopyWith<$Res> {
  _$AttendanceDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? attendee = null,
    Object? subject = null,
    Object? createAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      attendee: null == attendee
          ? _value.attendee
          : attendee // ignore: cast_nullable_to_non_nullable
              as UserDto,
      subject: null == subject
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as SubjectDto,
      createAt: null == createAt
          ? _value.createAt
          : createAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserDtoCopyWith<$Res> get attendee {
    return $UserDtoCopyWith<$Res>(_value.attendee, (value) {
      return _then(_value.copyWith(attendee: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SubjectDtoCopyWith<$Res> get subject {
    return $SubjectDtoCopyWith<$Res>(_value.subject, (value) {
      return _then(_value.copyWith(subject: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_AttendanceDtoCopyWith<$Res>
    implements $AttendanceDtoCopyWith<$Res> {
  factory _$$_AttendanceDtoCopyWith(
          _$_AttendanceDto value, $Res Function(_$_AttendanceDto) then) =
      __$$_AttendanceDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id, UserDto attendee, SubjectDto subject, DateTime createAt});

  @override
  $UserDtoCopyWith<$Res> get attendee;
  @override
  $SubjectDtoCopyWith<$Res> get subject;
}

/// @nodoc
class __$$_AttendanceDtoCopyWithImpl<$Res>
    extends _$AttendanceDtoCopyWithImpl<$Res, _$_AttendanceDto>
    implements _$$_AttendanceDtoCopyWith<$Res> {
  __$$_AttendanceDtoCopyWithImpl(
      _$_AttendanceDto _value, $Res Function(_$_AttendanceDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? attendee = null,
    Object? subject = null,
    Object? createAt = null,
  }) {
    return _then(_$_AttendanceDto(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      attendee: null == attendee
          ? _value.attendee
          : attendee // ignore: cast_nullable_to_non_nullable
              as UserDto,
      subject: null == subject
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as SubjectDto,
      createAt: null == createAt
          ? _value.createAt
          : createAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AttendanceDto implements _AttendanceDto {
  const _$_AttendanceDto(
      {required this.id,
      required this.attendee,
      required this.subject,
      required this.createAt});

  factory _$_AttendanceDto.fromJson(Map<String, dynamic> json) =>
      _$$_AttendanceDtoFromJson(json);

  @override
  final String id;
  @override
  final UserDto attendee;
  @override
  final SubjectDto subject;
  @override
  final DateTime createAt;

  @override
  String toString() {
    return 'AttendanceDto(id: $id, attendee: $attendee, subject: $subject, createAt: $createAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AttendanceDto &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.attendee, attendee) ||
                other.attendee == attendee) &&
            (identical(other.subject, subject) || other.subject == subject) &&
            (identical(other.createAt, createAt) ||
                other.createAt == createAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, attendee, subject, createAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AttendanceDtoCopyWith<_$_AttendanceDto> get copyWith =>
      __$$_AttendanceDtoCopyWithImpl<_$_AttendanceDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AttendanceDtoToJson(
      this,
    );
  }
}

abstract class _AttendanceDto implements AttendanceDto {
  const factory _AttendanceDto(
      {required final String id,
      required final UserDto attendee,
      required final SubjectDto subject,
      required final DateTime createAt}) = _$_AttendanceDto;

  factory _AttendanceDto.fromJson(Map<String, dynamic> json) =
      _$_AttendanceDto.fromJson;

  @override
  String get id;
  @override
  UserDto get attendee;
  @override
  SubjectDto get subject;
  @override
  DateTime get createAt;
  @override
  @JsonKey(ignore: true)
  _$$_AttendanceDtoCopyWith<_$_AttendanceDto> get copyWith =>
      throw _privateConstructorUsedError;
}
