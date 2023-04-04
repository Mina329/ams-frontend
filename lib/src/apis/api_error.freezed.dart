// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_error.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ApiError {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() network,
    required TResult Function(String msg) internal,
    required TResult Function(String msg) authorization,
    required TResult Function(String msg) invalidOperation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? network,
    TResult? Function(String msg)? internal,
    TResult? Function(String msg)? authorization,
    TResult? Function(String msg)? invalidOperation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? network,
    TResult Function(String msg)? internal,
    TResult Function(String msg)? authorization,
    TResult Function(String msg)? invalidOperation,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Network value) network,
    required TResult Function(Internal value) internal,
    required TResult Function(Authorization value) authorization,
    required TResult Function(InvalidOperation value) invalidOperation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Network value)? network,
    TResult? Function(Internal value)? internal,
    TResult? Function(Authorization value)? authorization,
    TResult? Function(InvalidOperation value)? invalidOperation,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Network value)? network,
    TResult Function(Internal value)? internal,
    TResult Function(Authorization value)? authorization,
    TResult Function(InvalidOperation value)? invalidOperation,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiErrorCopyWith<$Res> {
  factory $ApiErrorCopyWith(ApiError value, $Res Function(ApiError) then) =
      _$ApiErrorCopyWithImpl<$Res, ApiError>;
}

/// @nodoc
class _$ApiErrorCopyWithImpl<$Res, $Val extends ApiError>
    implements $ApiErrorCopyWith<$Res> {
  _$ApiErrorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$NetworkCopyWith<$Res> {
  factory _$$NetworkCopyWith(_$Network value, $Res Function(_$Network) then) =
      __$$NetworkCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NetworkCopyWithImpl<$Res>
    extends _$ApiErrorCopyWithImpl<$Res, _$Network>
    implements _$$NetworkCopyWith<$Res> {
  __$$NetworkCopyWithImpl(_$Network _value, $Res Function(_$Network) _then)
      : super(_value, _then);
}

/// @nodoc

class _$Network implements Network {
  const _$Network();

  @override
  String toString() {
    return 'ApiError.network()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Network);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() network,
    required TResult Function(String msg) internal,
    required TResult Function(String msg) authorization,
    required TResult Function(String msg) invalidOperation,
  }) {
    return network();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? network,
    TResult? Function(String msg)? internal,
    TResult? Function(String msg)? authorization,
    TResult? Function(String msg)? invalidOperation,
  }) {
    return network?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? network,
    TResult Function(String msg)? internal,
    TResult Function(String msg)? authorization,
    TResult Function(String msg)? invalidOperation,
    required TResult orElse(),
  }) {
    if (network != null) {
      return network();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Network value) network,
    required TResult Function(Internal value) internal,
    required TResult Function(Authorization value) authorization,
    required TResult Function(InvalidOperation value) invalidOperation,
  }) {
    return network(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Network value)? network,
    TResult? Function(Internal value)? internal,
    TResult? Function(Authorization value)? authorization,
    TResult? Function(InvalidOperation value)? invalidOperation,
  }) {
    return network?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Network value)? network,
    TResult Function(Internal value)? internal,
    TResult Function(Authorization value)? authorization,
    TResult Function(InvalidOperation value)? invalidOperation,
    required TResult orElse(),
  }) {
    if (network != null) {
      return network(this);
    }
    return orElse();
  }
}

abstract class Network implements ApiError {
  const factory Network() = _$Network;
}

/// @nodoc
abstract class _$$InternalCopyWith<$Res> {
  factory _$$InternalCopyWith(
          _$Internal value, $Res Function(_$Internal) then) =
      __$$InternalCopyWithImpl<$Res>;
  @useResult
  $Res call({String msg});
}

/// @nodoc
class __$$InternalCopyWithImpl<$Res>
    extends _$ApiErrorCopyWithImpl<$Res, _$Internal>
    implements _$$InternalCopyWith<$Res> {
  __$$InternalCopyWithImpl(_$Internal _value, $Res Function(_$Internal) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? msg = null,
  }) {
    return _then(_$Internal(
      null == msg
          ? _value.msg
          : msg // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$Internal implements Internal {
  const _$Internal(this.msg);

  @override
  final String msg;

  @override
  String toString() {
    return 'ApiError.internal(msg: $msg)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Internal &&
            (identical(other.msg, msg) || other.msg == msg));
  }

  @override
  int get hashCode => Object.hash(runtimeType, msg);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InternalCopyWith<_$Internal> get copyWith =>
      __$$InternalCopyWithImpl<_$Internal>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() network,
    required TResult Function(String msg) internal,
    required TResult Function(String msg) authorization,
    required TResult Function(String msg) invalidOperation,
  }) {
    return internal(msg);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? network,
    TResult? Function(String msg)? internal,
    TResult? Function(String msg)? authorization,
    TResult? Function(String msg)? invalidOperation,
  }) {
    return internal?.call(msg);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? network,
    TResult Function(String msg)? internal,
    TResult Function(String msg)? authorization,
    TResult Function(String msg)? invalidOperation,
    required TResult orElse(),
  }) {
    if (internal != null) {
      return internal(msg);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Network value) network,
    required TResult Function(Internal value) internal,
    required TResult Function(Authorization value) authorization,
    required TResult Function(InvalidOperation value) invalidOperation,
  }) {
    return internal(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Network value)? network,
    TResult? Function(Internal value)? internal,
    TResult? Function(Authorization value)? authorization,
    TResult? Function(InvalidOperation value)? invalidOperation,
  }) {
    return internal?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Network value)? network,
    TResult Function(Internal value)? internal,
    TResult Function(Authorization value)? authorization,
    TResult Function(InvalidOperation value)? invalidOperation,
    required TResult orElse(),
  }) {
    if (internal != null) {
      return internal(this);
    }
    return orElse();
  }
}

abstract class Internal implements ApiError {
  const factory Internal(final String msg) = _$Internal;

  String get msg;
  @JsonKey(ignore: true)
  _$$InternalCopyWith<_$Internal> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AuthorizationCopyWith<$Res> {
  factory _$$AuthorizationCopyWith(
          _$Authorization value, $Res Function(_$Authorization) then) =
      __$$AuthorizationCopyWithImpl<$Res>;
  @useResult
  $Res call({String msg});
}

/// @nodoc
class __$$AuthorizationCopyWithImpl<$Res>
    extends _$ApiErrorCopyWithImpl<$Res, _$Authorization>
    implements _$$AuthorizationCopyWith<$Res> {
  __$$AuthorizationCopyWithImpl(
      _$Authorization _value, $Res Function(_$Authorization) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? msg = null,
  }) {
    return _then(_$Authorization(
      null == msg
          ? _value.msg
          : msg // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$Authorization implements Authorization {
  const _$Authorization(this.msg);

  @override
  final String msg;

  @override
  String toString() {
    return 'ApiError.authorization(msg: $msg)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Authorization &&
            (identical(other.msg, msg) || other.msg == msg));
  }

  @override
  int get hashCode => Object.hash(runtimeType, msg);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthorizationCopyWith<_$Authorization> get copyWith =>
      __$$AuthorizationCopyWithImpl<_$Authorization>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() network,
    required TResult Function(String msg) internal,
    required TResult Function(String msg) authorization,
    required TResult Function(String msg) invalidOperation,
  }) {
    return authorization(msg);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? network,
    TResult? Function(String msg)? internal,
    TResult? Function(String msg)? authorization,
    TResult? Function(String msg)? invalidOperation,
  }) {
    return authorization?.call(msg);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? network,
    TResult Function(String msg)? internal,
    TResult Function(String msg)? authorization,
    TResult Function(String msg)? invalidOperation,
    required TResult orElse(),
  }) {
    if (authorization != null) {
      return authorization(msg);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Network value) network,
    required TResult Function(Internal value) internal,
    required TResult Function(Authorization value) authorization,
    required TResult Function(InvalidOperation value) invalidOperation,
  }) {
    return authorization(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Network value)? network,
    TResult? Function(Internal value)? internal,
    TResult? Function(Authorization value)? authorization,
    TResult? Function(InvalidOperation value)? invalidOperation,
  }) {
    return authorization?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Network value)? network,
    TResult Function(Internal value)? internal,
    TResult Function(Authorization value)? authorization,
    TResult Function(InvalidOperation value)? invalidOperation,
    required TResult orElse(),
  }) {
    if (authorization != null) {
      return authorization(this);
    }
    return orElse();
  }
}

abstract class Authorization implements ApiError {
  const factory Authorization(final String msg) = _$Authorization;

  String get msg;
  @JsonKey(ignore: true)
  _$$AuthorizationCopyWith<_$Authorization> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$InvalidOperationCopyWith<$Res> {
  factory _$$InvalidOperationCopyWith(
          _$InvalidOperation value, $Res Function(_$InvalidOperation) then) =
      __$$InvalidOperationCopyWithImpl<$Res>;
  @useResult
  $Res call({String msg});
}

/// @nodoc
class __$$InvalidOperationCopyWithImpl<$Res>
    extends _$ApiErrorCopyWithImpl<$Res, _$InvalidOperation>
    implements _$$InvalidOperationCopyWith<$Res> {
  __$$InvalidOperationCopyWithImpl(
      _$InvalidOperation _value, $Res Function(_$InvalidOperation) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? msg = null,
  }) {
    return _then(_$InvalidOperation(
      null == msg
          ? _value.msg
          : msg // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$InvalidOperation implements InvalidOperation {
  const _$InvalidOperation(this.msg);

  @override
  final String msg;

  @override
  String toString() {
    return 'ApiError.invalidOperation(msg: $msg)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InvalidOperation &&
            (identical(other.msg, msg) || other.msg == msg));
  }

  @override
  int get hashCode => Object.hash(runtimeType, msg);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InvalidOperationCopyWith<_$InvalidOperation> get copyWith =>
      __$$InvalidOperationCopyWithImpl<_$InvalidOperation>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() network,
    required TResult Function(String msg) internal,
    required TResult Function(String msg) authorization,
    required TResult Function(String msg) invalidOperation,
  }) {
    return invalidOperation(msg);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? network,
    TResult? Function(String msg)? internal,
    TResult? Function(String msg)? authorization,
    TResult? Function(String msg)? invalidOperation,
  }) {
    return invalidOperation?.call(msg);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? network,
    TResult Function(String msg)? internal,
    TResult Function(String msg)? authorization,
    TResult Function(String msg)? invalidOperation,
    required TResult orElse(),
  }) {
    if (invalidOperation != null) {
      return invalidOperation(msg);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Network value) network,
    required TResult Function(Internal value) internal,
    required TResult Function(Authorization value) authorization,
    required TResult Function(InvalidOperation value) invalidOperation,
  }) {
    return invalidOperation(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Network value)? network,
    TResult? Function(Internal value)? internal,
    TResult? Function(Authorization value)? authorization,
    TResult? Function(InvalidOperation value)? invalidOperation,
  }) {
    return invalidOperation?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Network value)? network,
    TResult Function(Internal value)? internal,
    TResult Function(Authorization value)? authorization,
    TResult Function(InvalidOperation value)? invalidOperation,
    required TResult orElse(),
  }) {
    if (invalidOperation != null) {
      return invalidOperation(this);
    }
    return orElse();
  }
}

abstract class InvalidOperation implements ApiError {
  const factory InvalidOperation(final String msg) = _$InvalidOperation;

  String get msg;
  @JsonKey(ignore: true)
  _$$InvalidOperationCopyWith<_$InvalidOperation> get copyWith =>
      throw _privateConstructorUsedError;
}
