import 'dart:async';

import 'package:ams_frontend/src/features/subjects/states/subject_details_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repositories/subjects_repositories.dart';

class SubjectDetailsNotifier
    extends AutoDisposeFamilyAsyncNotifier<SubjectDetailsState, String> {
  @override
  FutureOr<SubjectDetailsState> build(String arg) async {
    final repo = await ref.watch(subjectsRepositoryProvider.future);
    await Future.delayed(const Duration(seconds: 2)); // TODO: remove
    return SubjectDetailsState(subject: await repo.subject(arg), attendees: []);
  }
}
