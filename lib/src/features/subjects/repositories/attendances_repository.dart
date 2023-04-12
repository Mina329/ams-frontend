import 'package:ams_frontend/src/apis/AMSApi/ams_api.dart';

import '../../auth/models/models.dart';
import '../models/models.dart';

class AttendancesRepository {
  final AMSApi _amsApi;
  // ignore: unused_field
  final User _user;

  AttendancesRepository(this._amsApi, this._user);

  Future<List<Attendance>> getAttendances(
    String subjectId, {
    String? attendeeId,
  }) async {
    var response = await _amsApi.attendances(subjectId, attendeeId: attendeeId);

    final apiAttendances = response.requireData!;

    return apiAttendances
        .map((attendance) => attendance.intoAttendance())
        .toList();
  }

  Future<Attendance> takeAttendance({
    required String subjectId,
    required String attendeeId,
  }) async {
    final response = await _amsApi.takeAttendance(
      subjectId: subjectId,
      attendeeId: attendeeId,
    );

    final apiAttendance = response.requireData!;

    return apiAttendance.intoAttendance();
  }
}
