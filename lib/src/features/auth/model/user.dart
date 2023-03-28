import 'package:ams_frontend/src/apis/AMSApi/dto/api_user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

enum UserType {
  attendee,
  instructor,
}

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

extension IntoUser on ApiUser {
  User intoAttendee() => User(
        id: id,
        number: number,
        name: name,
        email: email,
        type: UserType.attendee,
        createAt: createAt,
        updatedAt: updatedAt,
      );
  User intoInstructor() => User(
        id: id,
        number: number,
        name: name,
        email: email,
        type: UserType.instructor,
        createAt: createAt,
        updatedAt: updatedAt,
      );
}
