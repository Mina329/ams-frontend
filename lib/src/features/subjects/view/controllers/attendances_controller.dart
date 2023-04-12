import 'package:ams_frontend/src/features/subjects/models/models.dart';
import 'package:ams_frontend/src/features/subjects/repositories/repositores.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'attendances_controller.freezed.dart';
part 'attendances_controller.g.dart';

@freezed
class AttendancesState with _$AttendancesState {
  const factory AttendancesState.init() = Init;
  const factory AttendancesState.taken(Attendance attendance) = Taken;
}

@riverpod
class AttendancesController extends _$AttendancesController {
  @override
  FutureOr<AttendancesState> build() async {
    return const AttendancesState.init();
  }

  Future takeAttendance({
    required String subjectId,
    required String attendeeId,
  }) async {
    final repo = await ref.watch(attendancesRepositoryProvider.future);
    state = await AsyncValue.guard(() async {
      final attendance = await repo.takeAttendance(
        subjectId: subjectId,
        attendeeId: attendeeId,
      );
      return AttendancesState.taken(attendance);
    });
  }
}
