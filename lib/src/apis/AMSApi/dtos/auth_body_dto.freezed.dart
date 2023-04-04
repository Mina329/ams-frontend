// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_body_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AuthBodyDto _$AuthBodyDtoFromJson(Map<String, dynamic> json) {
  return _AuthBodyDto.fromJson(json);
}

/// @nodoc
mixin _$AuthBodyDto {
  String get token => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AuthBodyDtoCopyWith<AuthBodyDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthBodyDtoCopyWith<$Res> {
  factory $AuthBodyDtoCopyWith(
          AuthBodyDto value, $Res Function(AuthBodyDto) then) =
      _$AuthBodyDtoCopyWithImpl<$Res, AuthBodyDto>;
  @useResult
  $Res call({String token});
}

/// @nodoc
class _$AuthBodyDtoCopyWithImpl<$Res, $Val extends AuthBodyDto>
    implements $AuthBodyDtoCopyWith<$Res> {
  _$AuthBodyDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
  }) {
    return _then(_value.copyWith(
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AuthBodyDtoCopyWith<$Res>
    implements $AuthBodyDtoCopyWith<$Res> {
  factory _$$_AuthBodyDtoCopyWith(
          _$_AuthBodyDto value, $Res Function(_$_AuthBodyDto) then) =
      __$$_AuthBodyDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String token});
}

/// @nodoc
class __$$_AuthBodyDtoCopyWithImpl<$Res>
    extends _$AuthBodyDtoCopyWithImpl<$Res, _$_AuthBodyDto>
    implements _$$_AuthBodyDtoCopyWith<$Res> {
  __$$_AuthBodyDtoCopyWithImpl(
      _$_AuthBodyDto _value, $Res Function(_$_AuthBodyDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
  }) {
    return _then(_$_AuthBodyDto(
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AuthBodyDto implements _AuthBodyDto {
  const _$_AuthBodyDto({required this.token});

  factory _$_AuthBodyDto.fromJson(Map<String, dynamic> json) =>
      _$$_AuthBodyDtoFromJson(json);

  @override
  final String token;

  @override
  String toString() {
    return 'AuthBodyDto(token: $token)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AuthBodyDto &&
            (identical(other.token, token) || other.token == token));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, token);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AuthBodyDtoCopyWith<_$_AuthBodyDto> get copyWith =>
      __$$_AuthBodyDtoCopyWithImpl<_$_AuthBodyDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AuthBodyDtoToJson(
      this,
    );
  }
}

abstract class _AuthBodyDto implements AuthBodyDto {
  const factory _AuthBodyDto({required final String token}) = _$_AuthBodyDto;

  factory _AuthBodyDto.fromJson(Map<String, dynamic> json) =
      _$_AuthBodyDto.fromJson;

  @override
  String get token;
  @override
  @JsonKey(ignore: true)
  _$$_AuthBodyDtoCopyWith<_$_AuthBodyDto> get copyWith =>
      throw _privateConstructorUsedError;
}
