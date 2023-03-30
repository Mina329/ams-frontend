// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'onboarding_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OnboardingState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() completed,
    required TResult Function(List<OnboardingModel> list) notCompleted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? completed,
    TResult? Function(List<OnboardingModel> list)? notCompleted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? completed,
    TResult Function(List<OnboardingModel> list)? notCompleted,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Completed value) completed,
    required TResult Function(_NotCompleted value) notCompleted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Completed value)? completed,
    TResult? Function(_NotCompleted value)? notCompleted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Completed value)? completed,
    TResult Function(_NotCompleted value)? notCompleted,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OnboardingStateCopyWith<$Res> {
  factory $OnboardingStateCopyWith(
          OnboardingState value, $Res Function(OnboardingState) then) =
      _$OnboardingStateCopyWithImpl<$Res, OnboardingState>;
}

/// @nodoc
class _$OnboardingStateCopyWithImpl<$Res, $Val extends OnboardingState>
    implements $OnboardingStateCopyWith<$Res> {
  _$OnboardingStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_CompletedCopyWith<$Res> {
  factory _$$_CompletedCopyWith(
          _$_Completed value, $Res Function(_$_Completed) then) =
      __$$_CompletedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_CompletedCopyWithImpl<$Res>
    extends _$OnboardingStateCopyWithImpl<$Res, _$_Completed>
    implements _$$_CompletedCopyWith<$Res> {
  __$$_CompletedCopyWithImpl(
      _$_Completed _value, $Res Function(_$_Completed) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Completed implements _Completed {
  const _$_Completed();

  @override
  String toString() {
    return 'OnboardingState.completed()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Completed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() completed,
    required TResult Function(List<OnboardingModel> list) notCompleted,
  }) {
    return completed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? completed,
    TResult? Function(List<OnboardingModel> list)? notCompleted,
  }) {
    return completed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? completed,
    TResult Function(List<OnboardingModel> list)? notCompleted,
    required TResult orElse(),
  }) {
    if (completed != null) {
      return completed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Completed value) completed,
    required TResult Function(_NotCompleted value) notCompleted,
  }) {
    return completed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Completed value)? completed,
    TResult? Function(_NotCompleted value)? notCompleted,
  }) {
    return completed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Completed value)? completed,
    TResult Function(_NotCompleted value)? notCompleted,
    required TResult orElse(),
  }) {
    if (completed != null) {
      return completed(this);
    }
    return orElse();
  }
}

abstract class _Completed implements OnboardingState {
  const factory _Completed() = _$_Completed;
}

/// @nodoc
abstract class _$$_NotCompletedCopyWith<$Res> {
  factory _$$_NotCompletedCopyWith(
          _$_NotCompleted value, $Res Function(_$_NotCompleted) then) =
      __$$_NotCompletedCopyWithImpl<$Res>;
  @useResult
  $Res call({List<OnboardingModel> list});
}

/// @nodoc
class __$$_NotCompletedCopyWithImpl<$Res>
    extends _$OnboardingStateCopyWithImpl<$Res, _$_NotCompleted>
    implements _$$_NotCompletedCopyWith<$Res> {
  __$$_NotCompletedCopyWithImpl(
      _$_NotCompleted _value, $Res Function(_$_NotCompleted) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? list = null,
  }) {
    return _then(_$_NotCompleted(
      null == list
          ? _value._list
          : list // ignore: cast_nullable_to_non_nullable
              as List<OnboardingModel>,
    ));
  }
}

/// @nodoc

class _$_NotCompleted implements _NotCompleted {
  const _$_NotCompleted(final List<OnboardingModel> list) : _list = list;

  final List<OnboardingModel> _list;
  @override
  List<OnboardingModel> get list {
    if (_list is EqualUnmodifiableListView) return _list;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_list);
  }

  @override
  String toString() {
    return 'OnboardingState.notCompleted(list: $list)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NotCompleted &&
            const DeepCollectionEquality().equals(other._list, _list));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_list));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NotCompletedCopyWith<_$_NotCompleted> get copyWith =>
      __$$_NotCompletedCopyWithImpl<_$_NotCompleted>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() completed,
    required TResult Function(List<OnboardingModel> list) notCompleted,
  }) {
    return notCompleted(list);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? completed,
    TResult? Function(List<OnboardingModel> list)? notCompleted,
  }) {
    return notCompleted?.call(list);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? completed,
    TResult Function(List<OnboardingModel> list)? notCompleted,
    required TResult orElse(),
  }) {
    if (notCompleted != null) {
      return notCompleted(list);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Completed value) completed,
    required TResult Function(_NotCompleted value) notCompleted,
  }) {
    return notCompleted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Completed value)? completed,
    TResult? Function(_NotCompleted value)? notCompleted,
  }) {
    return notCompleted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Completed value)? completed,
    TResult Function(_NotCompleted value)? notCompleted,
    required TResult orElse(),
  }) {
    if (notCompleted != null) {
      return notCompleted(this);
    }
    return orElse();
  }
}

abstract class _NotCompleted implements OnboardingState {
  const factory _NotCompleted(final List<OnboardingModel> list) =
      _$_NotCompleted;

  List<OnboardingModel> get list;
  @JsonKey(ignore: true)
  _$$_NotCompletedCopyWith<_$_NotCompleted> get copyWith =>
      throw _privateConstructorUsedError;
}
