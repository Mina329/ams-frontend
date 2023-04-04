import 'package:ams_frontend/src/features/auth/models/models.dart';
import 'package:ams_frontend/src/features/subjects/repositories/subjects_repositories.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'subject_attendees_provider.g.dart';

@riverpod
Future<List<User>> subjectAttendees(
  SubjectAttendeesRef ref,
  String subjectId,
) async {
  final repo = await ref.watch(subjectsRepositoryProvider.future);
  return repo.getAttendees(subjectId);
}
