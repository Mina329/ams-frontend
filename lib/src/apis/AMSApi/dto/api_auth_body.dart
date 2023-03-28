import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_auth_body.freezed.dart';
part 'api_auth_body.g.dart';

@freezed
class ApiAuthBody with _$ApiAuthBody {
  const factory ApiAuthBody({required String token}) = _ApiAuthBody;
  factory ApiAuthBody.fromJson(Map<String, Object?> json) =>
      _$ApiAuthBodyFromJson(json);
}
