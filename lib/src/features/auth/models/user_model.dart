import 'package:ams_frontend/src/apis/AMSApi/ams_api.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';

@freezed
class User with _$User {
  const factory User({
    required String id,
    required int number,
    required String name,
    required String email,
    required UserType type,
    required DateTime createAt,
    required DateTime updatedAt,
  }) = _User;
}

extension IntoUser on UserDto {
  User intoUser(UserType userType) => User(
        id: id,
        number: number,
        name: name,
        email: email,
        type: userType,
        createAt: createAt,
        updatedAt: updatedAt,
      );
}
