import 'package:freezed_annotation/freezed_annotation.dart';
part 'api_user.freezed.dart';
part 'api_user.g.dart';

@freezed
class ApiUser with _$ApiUser {
  const factory ApiUser({
    required String id,
    required int number,
    required String name,
    required String email,
    required DateTime createAt,
    required DateTime updatedAt,
  }) = _ApiUser;

  factory ApiUser.fromJson(Map<String, Object?> json) =>
      _$ApiUserFromJson(json);
}
