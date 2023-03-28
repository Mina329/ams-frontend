// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_error.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthError {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) unauthorized,
    required TResult Function(ApiError apiError) api,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? unauthorized,
    TResult? Function(ApiError apiError)? api,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? unauthorized,
    TResult Function(ApiError apiError)? api,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Unauthorized value) unauthorized,
    required TResult Function(Api value) api,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Unauthorized value)? unauthorized,
    TResult? Function(Api value)? api,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Unauthorized value)? unauthorized,
    TResult Function(Api value)? api,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthErrorCopyWith<$Res> {
  factory $AuthErrorCopyWith(AuthError value, $Res Function(AuthError) then) =
      _$AuthErrorCopyWithImpl<$Res, AuthError>;
}

/// @nodoc
class _$AuthErrorCopyWithImpl<$Res, $Val extends AuthError>
    implements $AuthErrorCopyWith<$Res> {
  _$AuthErrorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$UnauthorizedCopyWith<$Res> {
  factory _$$UnauthorizedCopyWith(
          _$Unauthorized value, $Res Function(_$Unauthorized) then) =
      __$$UnauthorizedCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$UnauthorizedCopyWithImpl<$Res>
    extends _$AuthErrorCopyWithImpl<$Res, _$Unauthorized>
    implements _$$UnauthorizedCopyWith<$Res> {
  __$$UnauthorizedCopyWithImpl(
      _$Unauthorized _value, $Res Function(_$Unauthorized) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$Unauthorized(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$Unauthorized implements Unauthorized {
  const _$Unauthorized(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'AuthError.unauthorized(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Unauthorized &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UnauthorizedCopyWith<_$Unauthorized> get copyWith =>
      __$$UnauthorizedCopyWithImpl<_$Unauthorized>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) unauthorized,
    required TResult Function(ApiError apiError) api,
  }) {
    return unauthorized(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? unauthorized,
    TResult? Function(ApiError apiError)? api,
  }) {
    return unauthorized?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? unauthorized,
    TResult Function(ApiError apiError)? api,
    required TResult orElse(),
  }) {
    if (unauthorized != null) {
      return unauthorized(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Unauthorized value) unauthorized,
    required TResult Function(Api value) api,
  }) {
    return unauthorized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Unauthorized value)? unauthorized,
    TResult? Function(Api value)? api,
  }) {
    return unauthorized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Unauthorized value)? unauthorized,
    TResult Function(Api value)? api,
    required TResult orElse(),
  }) {
    if (unauthorized != null) {
      return unauthorized(this);
    }
    return orElse();
  }
}

abstract class Unauthorized implements AuthError {
  const factory Unauthorized(final String message) = _$Unauthorized;

  String get message;
  @JsonKey(ignore: true)
  _$$UnauthorizedCopyWith<_$Unauthorized> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ApiCopyWith<$Res> {
  factory _$$ApiCopyWith(_$Api value, $Res Function(_$Api) then) =
      __$$ApiCopyWithImpl<$Res>;
  @useResult
  $Res call({ApiError apiError});

  $ApiErrorCopyWith<$Res> get apiError;
}

/// @nodoc
class __$$ApiCopyWithImpl<$Res> extends _$AuthErrorCopyWithImpl<$Res, _$Api>
    implements _$$ApiCopyWith<$Res> {
  __$$ApiCopyWithImpl(_$Api _value, $Res Function(_$Api) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? apiError = null,
  }) {
    return _then(_$Api(
      null == apiError
          ? _value.apiError
          : apiError // ignore: cast_nullable_to_non_nullable
              as ApiError,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $ApiErrorCopyWith<$Res> get apiError {
    return $ApiErrorCopyWith<$Res>(_value.apiError, (value) {
      return _then(_value.copyWith(apiError: value));
    });
  }
}

/// @nodoc

class _$Api implements Api {
  const _$Api(this.apiError);

  @override
  final ApiError apiError;

  @override
  String toString() {
    return 'AuthError.api(apiError: $apiError)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Api &&
            (identical(other.apiError, apiError) ||
                other.apiError == apiError));
  }

  @override
  int get hashCode => Object.hash(runtimeType, apiError);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ApiCopyWith<_$Api> get copyWith =>
      __$$ApiCopyWithImpl<_$Api>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) unauthorized,
    required TResult Function(ApiError apiError) api,
  }) {
    return api(apiError);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? unauthorized,
    TResult? Function(ApiError apiError)? api,
  }) {
    return api?.call(apiError);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? unauthorized,
    TResult Function(ApiError apiError)? api,
    required TResult orElse(),
  }) {
    if (api != null) {
      return api(apiError);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Unauthorized value) unauthorized,
    required TResult Function(Api value) api,
  }) {
    return api(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Unauthorized value)? unauthorized,
    TResult? Function(Api value)? api,
  }) {
    return api?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Unauthorized value)? unauthorized,
    TResult Function(Api value)? api,
    required TResult orElse(),
  }) {
    if (api != null) {
      return api(this);
    }
    return orElse();
  }
}

abstract class Api implements AuthError {
  const factory Api(final ApiError apiError) = _$Api;

  ApiError get apiError;
  @JsonKey(ignore: true)
  _$$ApiCopyWith<_$Api> get copyWith => throw _privateConstructorUsedError;
}
