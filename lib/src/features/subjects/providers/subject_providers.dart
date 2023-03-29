import 'package:ams_frontend/src/features/subjects/repositories/subjects_repositories.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final subjectListProvider = FutureProvider.autoDispose((ref) async {
  ref.keepAlive();
  final subjectsRepository = await ref.watch(subjectsRepositoryProvider.future);
  return await subjectsRepository.userSubjects();
});
