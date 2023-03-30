import 'package:ams_frontend/src/features/subjects/repositories/subjects_repositories.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final subjectListProvider = FutureProvider.autoDispose((ref) async {
  ref.keepAlive();
  final subjectsRepository = await ref.watch(subjectsRepositoryProvider.future);
  if (kDebugMode) {
    await Future.delayed(const Duration(seconds: 3));
  }
  return await subjectsRepository.userSubjects();
});
