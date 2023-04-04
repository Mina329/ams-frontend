import 'package:ams_frontend/src/apis/AMSApi/ams_api.dart';
import 'package:ams_frontend/src/features/auth/models/user_model.dart';
import 'package:ams_frontend/src/features/subjects/models/subject_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'attendance_model.freezed.dart';

@freezed
class Attendance with _$Attendance {
  const factory Attendance({
    required String id,
    required User attendee,
    required Subject subject,
    required DateTime createAt,
  }) = _Attendance;
}

extension IntoAttendance on AttendanceDto {
  Attendance intoAttendance() => Attendance(
        id: id,
        attendee: attendee.intoUser(UserType.attendee),
        subject: subject.intoSubject(),
        createAt: createAt,
      );
}
