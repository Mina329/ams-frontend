import 'package:ams_frontend/src/apis/AMSApi/ams_api.dart';
import 'package:ams_frontend/src/features/auth/models/models.dart';


class UsersRepository {
  final AMSApi _amsApi;
  // ignore: unused_field
  final User _user;

  UsersRepository(this._amsApi, this._user);

  Future<List<User>> getAttendees(
    String subjectId, {
    UserType userType = UserType.attendee,
  }) async {
    var response = await _amsApi.attendees(subjectId: subjectId);

    final apiUsers = response.requireData!;

    return apiUsers.map((user) => user.intoUser(userType)).toList();
  }
}
