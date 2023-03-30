import 'dart:async';

import 'package:ams_frontend/src/apis/AMSApi/ams_api.dart';
import 'package:ams_frontend/src/features/auth/models/user_model.dart';
import 'package:ams_frontend/src/features/subjects/models/attendance_model.dart';
import 'package:ams_frontend/src/features/subjects/repositories/subjects_repositories.dart';
import 'package:ams_frontend/src/utils/debug_delay.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../models/subject_model.dart';


part 'subject_details_controller.freezed.dart';
part 'subject_details_controller.g.dart';

// state
@freezed
class SubjectDetailsState with _$SubjectDetailsState {
  const factory SubjectDetailsState({
    required Subject subject,
    required List<UserModel> attendees,
    required List<Attendance> attendances,
  }) = _SubjectDetailsState;
}


// controller

@riverpod
class SubjectDetailsController
    extends _$SubjectDetailsController {
  @override
  FutureOr<SubjectDetailsState> build(String arg) async {
    final repo = await ref.watch(subjectsRepositoryProvider.future);
    await debugDelay();
    return SubjectDetailsState(
        subject: await repo.subject(arg), attendees: [], attendances: []);
  }

  Future<void> loadUsers() async {
    final repo = await ref.watch(subjectsRepositoryProvider.future);
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      return state.requireValue.copyWith(
        attendees: await repo.subjectUsers(
          id: state.requireValue.subject.id,
          userType: UserType.attendee,
        ),
      );
    });
  }

  Future<void> loadAttendances() async {
    final repo = await ref.watch(subjectsRepositoryProvider.future);
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      return state.requireValue.copyWith(
        attendances: await repo.subjectAttendances(
          state.requireValue.subject.id,
        ),
      );
    });
  }
}
