import 'package:ams_frontend/src/features/subjects/notifiers/subject_details_notifier.dart';
import 'package:ams_frontend/src/features/subjects/states/subject_details_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final subjectDetailsProvider = AsyncNotifierProvider.autoDispose
    .family<SubjectDetailsNotifier, SubjectDetailsState, String>(
        SubjectDetailsNotifier.new);
