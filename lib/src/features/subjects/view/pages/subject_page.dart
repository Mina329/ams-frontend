import 'package:ams_frontend/src/apis/AMSApi/ams_api.dart';
import 'package:ams_frontend/src/features/auth/view/controllers/auth_controller.dart';
import 'package:ams_frontend/src/features/subjects/view/pages/attendee_subject_page.dart';
import 'package:ams_frontend/src/features/subjects/view/pages/instructor_subject_page.dart';
import 'package:ams_frontend/src/konstants/konstants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SubjectDetailsPage extends ConsumerWidget {
  final String subjectId;

  const SubjectDetailsPage(this.subjectId, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authStateAsync = ref.watch(authControllerProvider);

    return Scaffold(
      body: authStateAsync.maybeWhen(
        orElse: () =>
            Center(child: CircularProgressIndicator(color: KColors.lightBlue)),
        data: (data) => data.when(
          signed: (user) => user.type == UserType.attendee
              ? AttendeeSubjectPage(
                  user.id,
                  subjectId: subjectId,
                )
              : InstructorSubjectPAge(
                  subjectId: subjectId,
                ),
          unsigned: () => Center(
              child: CircularProgressIndicator(color: KColors.lightBlue)),
        ),
      ),
    );
  }
}
