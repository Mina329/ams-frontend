import 'package:ams_frontend/src/apis/AMSApi/ams_api.dart';
import 'package:ams_frontend/src/features/auth/models/user_model.dart';
import 'package:ams_frontend/src/features/subjects/models/subject_model.dart';

class SubjectsRepository {
  final AMSApi _amsApi;
  final User _user;

  SubjectsRepository(this._amsApi, this._user);

  Future<Subject> getOne(String subjectId) async {
    var response = await _amsApi.subject(subjectId);

    final apiSubject = response.requireData!;

    return apiSubject.intoSubject();
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
