import 'package:ams_frontend/src/utils/utils.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/attendance_model.dart';
import '../repositories/repositores.dart';

part 'subject_attendances_providers.g.dart';

@riverpod
Future<List<Attendance>> subjectAttendances(
  SubjectAttendancesRef ref,
  String subjectId, {
  String? attendeeId,
}) async {
  final repo = await ref.watch(attendancesRepositoryProvider.future);
  return repo.getAttendances(subjectId, attendeeId: attendeeId);
}
