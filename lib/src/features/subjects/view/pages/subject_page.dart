import 'package:ams_frontend/src/apis/AMSApi/ams_api.dart';
import 'package:ams_frontend/src/features/auth/models/user_model.dart';
import 'package:ams_frontend/src/features/auth/view/controllers/auth_controller.dart';
import 'package:ams_frontend/src/features/subjects/models/attendance_model.dart';
import 'package:ams_frontend/src/features/subjects/models/subject_model.dart';
import 'package:ams_frontend/src/features/subjects/view/pages/attendee_subject_page.dart';
import 'package:ams_frontend/src/features/subjects/view/pages/instructor_subject_page.dart';
import 'package:ams_frontend/src/features/subjects/view/view.dart';
import 'package:ams_frontend/src/konstants/konstants.dart';
import 'package:ams_frontend/src/utils/utils.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/providers.dart';

class SubjectDetailsPage extends ConsumerWidget {
  final String subjectId;

  const SubjectDetailsPage(this.subjectId, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {




    final authStateAsync = ref.watch(authControllerProvider);

    return authStateAsync.maybeWhen(
      orElse: () => Center(child: CircularProgressIndicator(color: KColors.lightBlue)),
      data: (data) =>
          data.when(
            signed: (user) =>
            user.type == UserType.attendee ? AttendeeSubjectPage(subjectId: subjectId,) : InstructorSubjectPAge(subjectId: subjectId,),
            unsigned: () => Center(child: CircularProgressIndicator(color: KColors.lightBlue)),
          ),
    );
  }
}


