import 'package:ams_frontend/src/features/auth/models/models.dart';
import 'package:ams_frontend/src/features/subjects/providers/providers.dart';
import 'package:ams_frontend/src/features/subjects/repositories/repositores.dart';
import 'package:ams_frontend/src/utils/utils.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'attendances_controller.g.dart';
part 'attendances_controller.freezed.dart';

// TODO: handle error state.

@freezed
class AttendancesState with _$AttendancesState {
  const factory AttendancesState({
    @Default(false) bool isLoading,
    @Default([]) List<User> attendees,
    @Default(false) bool isSubmitted,
  }) = _AttendancesState;
}

@riverpod
class AttendancesController extends _$AttendancesController {
  late String _subjectId;

  @override
  AttendancesState build(String subjectId) {
    _subjectId = subjectId;
    return const AttendancesState();
  }

  void removeAttendee(User attendee) {
    // state change
    state = state.copyWith(
      attendees: state.attendees.where((a) => a.id != attendee.id).toList(),
    );
    Utils.logger.i('removed an attendee from attendances list');
  }

  // TODO: fix this error
  Future<void> takeByQr({
    required String attendeeId,
  }) async {
    var index = state.attendees.indexWhere((a) => a.id == attendeeId);
    if (index >= 0) {
      Utils.logger.i('attendee already present');
      return;
    }

    // state change
    state = state.copyWith(isLoading: true);

    final attendees = await ref.watch(
      subjectAttendeesProvider(_subjectId).future,
    );
    index = attendees.indexWhere((attendee) => attendee.id == attendeeId);
    final attendee = attendees[index];

    // state change
    state = state.copyWith(
      attendees: [attendee, ...state.attendees],
      isLoading: false,
    );
    Utils.logger.i('added a new attendee to the attendances list');
  }

  Future<void> takeByFace({
    required Uint8List image,
  }) async {
    // state change
    state = state.copyWith(isLoading: true);

    final repo = await ref.watch(
      usersRepositoryProvider.future,
    );
    final attendees = await repo.getAttendees(image: image);
    final bestMatch = attendees[0];
    final index = attendees.indexWhere((a) => a.id == bestMatch.id);
    final attendee = attendees[index];

    final previous = state.attendees;
    if (!previous.contains(attendee)) {
      // state change
      state = state.copyWith(
        attendees: [attendee, ...state.attendees],
        isLoading: false,
      );
      Utils.logger.i('attendee a new attendee to the attendances list');
    } else {
      // state change
      state = state.copyWith(isLoading: false);
      Utils.logger.i('attendee already present');
    }
  }

  Future<void> submit() async {
    // state change
    state = state.copyWith(isLoading: true);

    final repo = await ref.watch(attendancesRepositoryProvider.future);
    for (var attendee in state.attendees) {
      await repo.takeAttendance(subjectId: subjectId, attendeeId: attendee.id);
    }

    // state change
    state = state.copyWith(isLoading: false, isSubmitted: true);
    Utils.logger.i('submitted attendances successfully');
  }
}
