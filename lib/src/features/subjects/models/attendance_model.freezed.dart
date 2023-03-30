// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'attendance_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Attendance {
  String get id => throw _privateConstructorUsedError;
  UserModel get attendee => throw _privateConstructorUsedError;
  Subject get subject => throw _privateConstructorUsedError;
  DateTime get createAt => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AttendanceCopyWith<Attendance> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AttendanceCopyWith<$Res> {
  factory $AttendanceCopyWith(
          Attendance value, $Res Function(Attendance) then) =
      _$AttendanceCopyWithImpl<$Res, Attendance>;
  @useResult
  $Res call(
      {String id, UserModel attendee, Subject subject, DateTime createAt});

  $UserModelCopyWith<$Res> get attendee;
  $SubjectCopyWith<$Res> get subject;
}

/// @nodoc
class _$AttendanceCopyWithImpl<$Res, $Val extends Attendance>
    implements $AttendanceCopyWith<$Res> {
  _$AttendanceCopyWithImpl(this._value, this._then);

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
              as UserModel,
      subject: null == subject
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as Subject,
      createAt: null == createAt
          ? _value.createAt
          : createAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res> get attendee {
    return $UserModelCopyWith<$Res>(_value.attendee, (value) {
      return _then(_value.copyWith(attendee: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SubjectCopyWith<$Res> get subject {
    return $SubjectCopyWith<$Res>(_value.subject, (value) {
      return _then(_value.copyWith(subject: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_AttendanceCopyWith<$Res>
    implements $AttendanceCopyWith<$Res> {
  factory _$$_AttendanceCopyWith(
          _$_Attendance value, $Res Function(_$_Attendance) then) =
      __$$_AttendanceCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id, UserModel attendee, Subject subject, DateTime createAt});

  @override
  $UserModelCopyWith<$Res> get attendee;
  @override
  $SubjectCopyWith<$Res> get subject;
}

/// @nodoc
class __$$_AttendanceCopyWithImpl<$Res>
    extends _$AttendanceCopyWithImpl<$Res, _$_Attendance>
    implements _$$_AttendanceCopyWith<$Res> {
  __$$_AttendanceCopyWithImpl(
      _$_Attendance _value, $Res Function(_$_Attendance) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? attendee = null,
    Object? subject = null,
    Object? createAt = null,
  }) {
    return _then(_$_Attendance(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      attendee: null == attendee
          ? _value.attendee
          : attendee // ignore: cast_nullable_to_non_nullable
              as UserModel,
      subject: null == subject
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as Subject,
      createAt: null == createAt
          ? _value.createAt
          : createAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$_Attendance implements _Attendance {
  const _$_Attendance(
      {required this.id,
      required this.attendee,
      required this.subject,
      required this.createAt});

  @override
  final String id;
  @override
  final UserModel attendee;
  @override
  final Subject subject;
  @override
  final DateTime createAt;

  @override
  String toString() {
    return 'Attendance(id: $id, attendee: $attendee, subject: $subject, createAt: $createAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Attendance &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.attendee, attendee) ||
                other.attendee == attendee) &&
            (identical(other.subject, subject) || other.subject == subject) &&
            (identical(other.createAt, createAt) ||
                other.createAt == createAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, attendee, subject, createAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AttendanceCopyWith<_$_Attendance> get copyWith =>
      __$$_AttendanceCopyWithImpl<_$_Attendance>(this, _$identity);
}

abstract class _Attendance implements Attendance {
  const factory _Attendance(
      {required final String id,
      required final UserModel attendee,
      required final Subject subject,
      required final DateTime createAt}) = _$_Attendance;

  @override
  String get id;
  @override
  UserModel get attendee;
  @override
  Subject get subject;
  @override
  DateTime get createAt;
  @override
  @JsonKey(ignore: true)
  _$$_AttendanceCopyWith<_$_Attendance> get copyWith =>
      throw _privateConstructorUsedError;
}
