// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'response_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ResponseDto<T> _$ResponseDtoFromJson<T>(
    Map<String, dynamic> json, T Function(Object?) fromJsonT) {
  return _ResponseDto<T>.fromJson(json, fromJsonT);
}

/// @nodoc
mixin _$ResponseDto<T> {
  int get code => throw _privateConstructorUsedError;
  bool get status => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  T? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson(Object? Function(T) toJsonT) =>
      throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResponseDtoCopyWith<T, ResponseDto<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResponseDtoCopyWith<T, $Res> {
  factory $ResponseDtoCopyWith(
          ResponseDto<T> value, $Res Function(ResponseDto<T>) then) =
      _$ResponseDtoCopyWithImpl<T, $Res, ResponseDto<T>>;
  @useResult
  $Res call({int code, bool status, String message, T? data});
}

/// @nodoc
class _$ResponseDtoCopyWithImpl<T, $Res, $Val extends ResponseDto<T>>
    implements $ResponseDtoCopyWith<T, $Res> {
  _$ResponseDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? status = null,
    Object? message = null,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ResponseDtoCopyWith<T, $Res>
    implements $ResponseDtoCopyWith<T, $Res> {
  factory _$$_ResponseDtoCopyWith(
          _$_ResponseDto<T> value, $Res Function(_$_ResponseDto<T>) then) =
      __$$_ResponseDtoCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({int code, bool status, String message, T? data});
}

/// @nodoc
class __$$_ResponseDtoCopyWithImpl<T, $Res>
    extends _$ResponseDtoCopyWithImpl<T, $Res, _$_ResponseDto<T>>
    implements _$$_ResponseDtoCopyWith<T, $Res> {
  __$$_ResponseDtoCopyWithImpl(
      _$_ResponseDto<T> _value, $Res Function(_$_ResponseDto<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = null,
    Object? status = null,
    Object? message = null,
    Object? data = freezed,
  }) {
    return _then(_$_ResponseDto<T>(
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T?,
    ));
  }
}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)
class _$_ResponseDto<T> implements _ResponseDto<T> {
  const _$_ResponseDto(
      {required this.code,
      required this.status,
      required this.message,
      this.data});

  factory _$_ResponseDto.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$$_ResponseDtoFromJson(json, fromJsonT);

  @override
  final int code;
  @override
  final bool status;
  @override
  final String message;
  @override
  final T? data;

  @override
  String toString() {
    return 'ResponseDto<$T>(code: $code, status: $status, message: $message, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ResponseDto<T> &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, code, status, message,
      const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ResponseDtoCopyWith<T, _$_ResponseDto<T>> get copyWith =>
      __$$_ResponseDtoCopyWithImpl<T, _$_ResponseDto<T>>(this, _$identity);

  @override
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
    return _$$_ResponseDtoToJson<T>(this, toJsonT);
  }
}

abstract class _ResponseDto<T> implements ResponseDto<T> {
  const factory _ResponseDto(
      {required final int code,
      required final bool status,
      required final String message,
      final T? data}) = _$_ResponseDto<T>;

  factory _ResponseDto.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =
      _$_ResponseDto<T>.fromJson;

  @override
  int get code;
  @override
  bool get status;
  @override
  String get message;
  @override
  T? get data;
  @override
  @JsonKey(ignore: true)
  _$$_ResponseDtoCopyWith<T, _$_ResponseDto<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
