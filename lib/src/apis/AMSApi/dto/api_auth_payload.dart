import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_auth_payload.g.dart';
part 'api_auth_payload.freezed.dart';

@freezed
class ApiAuthPayload with _$ApiAuthPayload {
  const factory ApiAuthPayload({
    required String email,
    required String password,
  }) = _ApiAuthPayload;

  factory ApiAuthPayload.fromJson(Map<String, Object?> json) =>
      _$ApiAuthPayloadFromJson(json);
}
