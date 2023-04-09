import 'package:ams_frontend/src/features/subjects/repositories/subjects_repositories.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/attendance_model.dart';

part 'subject_attendances_provider.g.dart';

@riverpod
Future<List<Attendance>> subjectAttendances(
  SubjectAttendancesRef ref,
  String subjectId, {
  String? attendeeId,
}) async {
  final repo = await ref.watch(subjectsRepositoryProvider.future);
  return repo.getAttendances(subjectId, attendeeId: attendeeId);
}
