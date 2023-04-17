import 'package:ams_frontend/src/apis/AMSApi/ams_api.dart';
import 'package:ams_frontend/src/features/auth/models/models.dart';
import 'package:flutter/foundation.dart';

class UsersRepository {
  final AMSApi _amsApi;
  // ignore: unused_field
  final User _user;

  UsersRepository(this._amsApi, this._user);

  Future<List<User>> getAttendees({
    String? subjectId,
    UserType userType = UserType.attendee,
    Uint8List? image,
  }) async {
    var response = await _amsApi.attendees(subjectId: subjectId, image: image);

    final apiUsers = response.requireData!;

    return apiUsers.map((user) => user.intoUser(userType)).toList();
  }
}
