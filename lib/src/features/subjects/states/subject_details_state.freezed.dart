// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'subject_details_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SubjectDetailsState {
  Subject get subject => throw _privateConstructorUsedError;
  List<User> get attendees => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SubjectDetailsStateCopyWith<SubjectDetailsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubjectDetailsStateCopyWith<$Res> {
  factory $SubjectDetailsStateCopyWith(
          SubjectDetailsState value, $Res Function(SubjectDetailsState) then) =
      _$SubjectDetailsStateCopyWithImpl<$Res, SubjectDetailsState>;
  @useResult
  $Res call({Subject subject, List<User> attendees});

  $SubjectCopyWith<$Res> get subject;
}

/// @nodoc
class _$SubjectDetailsStateCopyWithImpl<$Res, $Val extends SubjectDetailsState>
    implements $SubjectDetailsStateCopyWith<$Res> {
  _$SubjectDetailsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subject = null,
    Object? attendees = null,
  }) {
    return _then(_value.copyWith(
      subject: null == subject
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as Subject,
      attendees: null == attendees
          ? _value.attendees
          : attendees // ignore: cast_nullable_to_non_nullable
              as List<User>,
    ) as $Val);
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
abstract class _$$_SubjectDetailsStateCopyWith<$Res>
    implements $SubjectDetailsStateCopyWith<$Res> {
  factory _$$_SubjectDetailsStateCopyWith(_$_SubjectDetailsState value,
          $Res Function(_$_SubjectDetailsState) then) =
      __$$_SubjectDetailsStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Subject subject, List<User> attendees});

  @override
  $SubjectCopyWith<$Res> get subject;
}

/// @nodoc
class __$$_SubjectDetailsStateCopyWithImpl<$Res>
    extends _$SubjectDetailsStateCopyWithImpl<$Res, _$_SubjectDetailsState>
    implements _$$_SubjectDetailsStateCopyWith<$Res> {
  __$$_SubjectDetailsStateCopyWithImpl(_$_SubjectDetailsState _value,
      $Res Function(_$_SubjectDetailsState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subject = null,
    Object? attendees = null,
  }) {
    return _then(_$_SubjectDetailsState(
      subject: null == subject
          ? _value.subject
          : subject // ignore: cast_nullable_to_non_nullable
              as Subject,
      attendees: null == attendees
          ? _value._attendees
          : attendees // ignore: cast_nullable_to_non_nullable
              as List<User>,
    ));
  }
}

/// @nodoc

class _$_SubjectDetailsState implements _SubjectDetailsState {
  const _$_SubjectDetailsState(
      {required this.subject, required final List<User> attendees})
      : _attendees = attendees;

  @override
  final Subject subject;
  final List<User> _attendees;
  @override
  List<User> get attendees {
    if (_attendees is EqualUnmodifiableListView) return _attendees;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_attendees);
  }

  @override
  String toString() {
    return 'SubjectDetailsState(subject: $subject, attendees: $attendees)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SubjectDetailsState &&
            (identical(other.subject, subject) || other.subject == subject) &&
            const DeepCollectionEquality()
                .equals(other._attendees, _attendees));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, subject, const DeepCollectionEquality().hash(_attendees));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SubjectDetailsStateCopyWith<_$_SubjectDetailsState> get copyWith =>
      __$$_SubjectDetailsStateCopyWithImpl<_$_SubjectDetailsState>(
          this, _$identity);
}

abstract class _SubjectDetailsState implements SubjectDetailsState {
  const factory _SubjectDetailsState(
      {required final Subject subject,
      required final List<User> attendees}) = _$_SubjectDetailsState;

  @override
  Subject get subject;
  @override
  List<User> get attendees;
  @override
  @JsonKey(ignore: true)
  _$$_SubjectDetailsStateCopyWith<_$_SubjectDetailsState> get copyWith =>
      throw _privateConstructorUsedError;
}
