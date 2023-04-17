import 'package:ams_frontend/src/apis/AMSApi/ams_api.dart';
import 'package:ams_frontend/src/features/auth/view/widgets/sigend_builder.dart';
import 'package:ams_frontend/src/features/subjects/view/pages/attendee_subject_page.dart';
import 'package:ams_frontend/src/features/subjects/view/pages/instructor_subject_page.dart';
import 'package:flutter/material.dart';

// TODO: try shimmer package
class SubjectDetailsPage extends StatelessWidget {
  final String subjectId;

  const SubjectDetailsPage(this.subjectId, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SignedBuilder(
        builder: (user) => user.type == UserType.attendee
            ? AttendeeSubjectPage(
                user.id,
                subjectId: subjectId,
              )
            : InstructorSubjectPage(
                subjectId: subjectId,
              ),
      ),
    );
  }
}
