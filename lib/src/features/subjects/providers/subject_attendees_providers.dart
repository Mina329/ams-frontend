import 'package:ams_frontend/src/features/auth/models/models.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../repositories/repositores.dart';

part 'subject_attendees_providers.g.dart';

@riverpod
Future<List<User>> subjectAttendees(
  SubjectAttendeesRef ref,
  String subjectId,
) async {
  final repo = await ref.watch(usersRepositoryProvider.future);
  return await repo.getAttendees(subjectId: subjectId);
}
