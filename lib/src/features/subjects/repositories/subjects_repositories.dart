import 'package:ams_frontend/src/apis/AMSApi/ams_api.dart';
import 'package:ams_frontend/src/features/auth/models/user.dart';
import 'package:ams_frontend/src/features/auth/providers/user_provider.dart';
import 'package:ams_frontend/src/features/subjects/models/subject_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SubjectsRepository {
  final AMSApi _amsApi;
  final User _user;

  SubjectsRepository(this._amsApi, this._user);

  Future<Subject> subject(String id) async {
    var response = await _amsApi.subject(id);
    if (!response.status) {
      throw UnimplementedError(); // TODO
    }

    final apiSubject = response.data!;

    return apiSubject.intoSubject();
  }

  Future<List<Subject>> userSubjects() async {
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

final subjectsRepositoryProvider = FutureProvider.autoDispose((ref) async {
  final amsApi = ref.watch(amsApiProvider);
  final user = await ref.watch(userProvider.future);
  return SubjectsRepository(amsApi, user!);
});
