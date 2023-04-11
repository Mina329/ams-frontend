import 'package:ams_frontend/src/apis/AMSApi/ams_api.dart';
import 'package:ams_frontend/src/features/auth/models/user_model.dart';
import 'package:ams_frontend/src/features/auth/repositories/auth_repository.dart';
import 'package:ams_frontend/src/features/subjects/models/attendance_model.dart';
import 'package:ams_frontend/src/features/subjects/models/subject_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'subjects_repositories.g.dart';

class SubjectsRepository {
  final AMSApi _amsApi;
  final User _user;

  SubjectsRepository(this._amsApi, this._user);

  Future<Subject> getOneSubject(String subjectId) async {
    var response = await _amsApi.subject(subjectId);

    final apiSubject = response.requireData!;

    return apiSubject.intoSubject();
  }

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

  Future<List<User>> getAttendees(
    String subjectId, {
    UserType userType = UserType.attendee,
  }) async {
    var response = await _amsApi.attendees(subjectId: subjectId);

    final apiUsers = response.requireData!;

    return apiUsers.map((user) => user.intoUser(userType)).toList();
  }

  Future<List<Subject>> getAllSubjectsForUser() async {
    var response = await _amsApi.subjects(
      userId: _user.id,
      userType: _user.type,
    );

    final apiSubjects = response.requireData!;

    return apiSubjects.map((subject) => subject.intoSubject()).toList();
  }
}

@riverpod
Future<SubjectsRepository> subjectsRepository(SubjectsRepositoryRef ref) async {
  final amsApi = ref.watch(amsApiProvider);
  final user = await ref.watch(authRepositoryProvider).login();
  return SubjectsRepository(amsApi, user!);
}
