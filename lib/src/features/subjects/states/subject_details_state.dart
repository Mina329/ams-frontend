import 'package:ams_frontend/src/features/auth/models/user.dart';
import 'package:ams_frontend/src/features/subjects/models/subject_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'subject_details_state.freezed.dart';

@freezed
class SubjectDetailsState with _$SubjectDetailsState {
  const factory SubjectDetailsState({
    required Subject subject,
    required List<User> attendees,
  }) = _SubjectDetailsState;
}
