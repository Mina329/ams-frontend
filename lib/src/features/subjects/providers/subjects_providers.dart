import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/models.dart';
import '../repositories/repositores.dart';

part 'subjects_providers.g.dart';

@Riverpod(keepAlive: true)
Future<List<Subject>> userSubjects(UserSubjectsRef ref) async {
  final repo = await ref.watch(subjectsRepositoryProvider.future);
  return await repo.getAllSubjectsForUser();
}

@riverpod
Future<Subject> subject(SubjectRef ref, String subjectId) async {
  final repo = await ref.watch(subjectsRepositoryProvider.future);
  return await repo.getOne(subjectId);
}
