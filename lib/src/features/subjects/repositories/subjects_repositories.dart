import 'package:ams_frontend/src/apis/AMSApi/ams_api.dart';
import 'package:ams_frontend/src/apis/apis.dart';
import 'package:ams_frontend/src/features/auth/models/user_model.dart';
import 'package:ams_frontend/src/features/auth/repositories/auth_repository.dart';
import 'package:ams_frontend/src/features/subjects/models/attendance_model.dart';
import 'package:ams_frontend/src/features/subjects/models/subject_model.dart';
import 'package:ams_frontend/src/features/subjects/subjects_error.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'subjects_repositories.g.dart';

class SubjectsRepository {
  final AMSApi _amsApi;
  final User _user;

  SubjectsRepository(this._amsApi, this._user);

  Future<Subject> getOne(String subjectId) async {
    try {
      var response = await _amsApi.subject(subjectId);
      if (!response.status) {
        throw SubjectsError.notFound(response.message);
      }

      final apiSubject = response.data!;

      return apiSubject.intoSubject();
    } on ApiError catch (error) {
      throw error.intoSubjectsError();
    }
  }

  Future<List<Attendance>> getAttendances(String subjectId) async {
    var response = await _amsApi.attendances(subjectId);

    if (!response.status) {
      throw UnimplementedError(); // TODO
    }

    final apiAttendances = response.data!;

    return apiAttendances
        .map((attendance) => attendance.intoAttendance())
        .toList();
  }

  Future<List<User>> getAttendees(
    String subjectId, {
    UserType userType = UserType.attendee,
  }) async {
    var response = await _amsApi.attendees(subjectId: subjectId);

    if (!response.status) {
      throw UnimplementedError(); // TODO
    }

    final apiUsers = response.data!;

    return apiUsers.map((user) => user.intoUser(userType)).toList();
  }

  Future<List<Subject>> getForUser() async {
    var response = await _amsApi.subjects(
      userId: _user.id,
      userType: _user.type,
    );

    if (!response.status) {
      throw UnimplementedError(); // TODO
    }

    final apiSubjects = response.data!;

    return apiSubjects.map((subject) => subject.intoSubject()).toList();
  }
}

@riverpod
Future<SubjectsRepository> subjectsRepository(SubjectsRepositoryRef ref) async {
  final amsApi = ref.watch(amsApiProvider);
  final user = await ref.watch(authRepositoryProvider).login();
  return SubjectsRepository(amsApi, user!);
}
