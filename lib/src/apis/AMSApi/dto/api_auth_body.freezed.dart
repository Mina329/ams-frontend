// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_auth_body.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ApiAuthBody _$ApiAuthBodyFromJson(Map<String, dynamic> json) {
  return _ApiAuthBody.fromJson(json);
}

/// @nodoc
mixin _$ApiAuthBody {
  String get token => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ApiAuthBodyCopyWith<ApiAuthBody> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiAuthBodyCopyWith<$Res> {
  factory $ApiAuthBodyCopyWith(
          ApiAuthBody value, $Res Function(ApiAuthBody) then) =
      _$ApiAuthBodyCopyWithImpl<$Res, ApiAuthBody>;
  @useResult
  $Res call({String token});
}

/// @nodoc
class _$ApiAuthBodyCopyWithImpl<$Res, $Val extends ApiAuthBody>
    implements $ApiAuthBodyCopyWith<$Res> {
  _$ApiAuthBodyCopyWithImpl(this._value, this._then);

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
abstract class _$$_ApiAuthBodyCopyWith<$Res>
    implements $ApiAuthBodyCopyWith<$Res> {
  factory _$$_ApiAuthBodyCopyWith(
          _$_ApiAuthBody value, $Res Function(_$_ApiAuthBody) then) =
      __$$_ApiAuthBodyCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String token});
}

/// @nodoc
class __$$_ApiAuthBodyCopyWithImpl<$Res>
    extends _$ApiAuthBodyCopyWithImpl<$Res, _$_ApiAuthBody>
    implements _$$_ApiAuthBodyCopyWith<$Res> {
  __$$_ApiAuthBodyCopyWithImpl(
      _$_ApiAuthBody _value, $Res Function(_$_ApiAuthBody) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
  }) {
    return _then(_$_ApiAuthBody(
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ApiAuthBody implements _ApiAuthBody {
  const _$_ApiAuthBody({required this.token});

  factory _$_ApiAuthBody.fromJson(Map<String, dynamic> json) =>
      _$$_ApiAuthBodyFromJson(json);

  @override
  final String token;

  @override
  String toString() {
    return 'ApiAuthBody(token: $token)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ApiAuthBody &&
            (identical(other.token, token) || other.token == token));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, token);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ApiAuthBodyCopyWith<_$_ApiAuthBody> get copyWith =>
      __$$_ApiAuthBodyCopyWithImpl<_$_ApiAuthBody>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ApiAuthBodyToJson(
      this,
    );
  }
}

abstract class _ApiAuthBody implements ApiAuthBody {
  const factory _ApiAuthBody({required final String token}) = _$_ApiAuthBody;

  factory _ApiAuthBody.fromJson(Map<String, dynamic> json) =
      _$_ApiAuthBody.fromJson;

  @override
  String get token;
  @override
  @JsonKey(ignore: true)
  _$$_ApiAuthBodyCopyWith<_$_ApiAuthBody> get copyWith =>
      throw _privateConstructorUsedError;
}
