import 'package:ams_frontend/src/apis/AMSApi/ams_api.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    required String id,
    required int number,
    required String name,
    required String email,
    required UserType type,
    required DateTime createAt,
    required DateTime updatedAt,
  }) = _UserModel;
}

extension IntoUser on UserDto {
  UserModel intoUser(UserType userType) => UserModel(
        id: id,
        number: number,
        name: name,
        email: email,
        type: userType,
        createAt: createAt,
        updatedAt: updatedAt,
      );
}
