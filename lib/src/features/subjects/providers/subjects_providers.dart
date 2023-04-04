import 'package:ams_frontend/src/features/subjects/repositories/subjects_repositories.dart';
import 'package:ams_frontend/src/utils/utils.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/models.dart';

part 'subjects_providers.g.dart';

@riverpod
Future<List<Subject>> userSubjects(UserSubjectsRef ref) async {
  await Utils.debugDelay();
  ref.keepAlive();
  final repo = await ref.watch(subjectsRepositoryProvider.future);
  return await repo.getForUser();
}

@riverpod
Future<Subject> subject(SubjectRef ref, String subjectId) async {
  await Utils.debugDelay();

  final repo = await ref.watch(subjectsRepositoryProvider.future);
  return await repo.getOne(subjectId);
}
