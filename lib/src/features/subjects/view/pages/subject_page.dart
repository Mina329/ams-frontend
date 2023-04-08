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
      orElse: () => const SizedBox(),
      data: (data) =>
          data.when(
            signed: (user) =>
            user.type == UserType.attendee ? AttendeeSubjectPage(subjectId: subjectId,) : InstructorSubjectPAge(subjectId: subjectId,),
            unsigned: () => const SizedBox(),
          ),
    );
  }
}




class AttendeesView extends ConsumerWidget {
  final List<User> attendees;

  const AttendeesView(this.attendees, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DataTable(
      columns: [
        DataColumn(
          label: Icon(
            KIcons.attendees,
            color: Theme
                .of(context)
                .scaffoldBackgroundColor,
          ),
          numeric: true,
        ),
        DataColumn(
          label: Text(context.l10n.attendee),
        ),
      ],
      rows: [
        for (int i = 1; i < attendees.length; i++)
          DataRow(
            cells: [
              DataCell(Text('$i'), placeholder: true),
              DataCell(Text(attendees[i].name)),
            ],
          )
      ],
      border: TableBorder.all(
        borderRadius: BorderRadius.circular(KRadiuses.r50),
      ),
      headingRowColor: MaterialStateProperty.resolveWith(
            (Set<MaterialState> states) =>
        Theme
            .of(context)
            .colorScheme
            .primary,
      ),
      headingTextStyle: TextStyle(
        color: Theme
            .of(context)
            .scaffoldBackgroundColor,
      ),
      clipBehavior: Clip.antiAlias,
    );
  }
}

// void actionsOnPress() {
//   if (pageController.page == 0) {
//     ref.invalidate(subjectProvider(subjectId));
//   } else if (pageController.page == 1) {
//     ref.invalidate(subjectAttendancesProvider(subjectId));
//   } else if (pageController.page == 2) {
//     ref.invalidate(subjectAttendeesProvider(subjectId));
//   }
// }
//



//Scaffold(
//           bottomNavigationBar: ConvexAppBar(
//             backgroundColor: Theme.of(context).colorScheme.primary,
//             key: navBarKey,
//             items: [
//               TabItem(icon: KIcons.about, title: 'info'.hardcoded),
//               TabItem(
//                 icon: KIcons.attendances,
//                 title: 'attendances'.hardcoded,
//               ),
//               if (user.type == UserType.instructor)
//                 TabItem(
//                   icon: KIcons.attendees,
//                   title: 'attendees'.hardcoded,
//                 ),
//             ],
//             onTap: (index) {
//               pageController.animateToPage(
//                 index,
//                 duration: KDurations.pageViewNavigation,
//                 curve: Curves.bounceInOut,
//               );
//             },
//           ),
//           body: Consumer(
//             builder: (context, ref, child) {
//               final subject = ref.watch(subjectProvider(subjectId));
//               final attendees = ref.watch(subjectAttendeesProvider(subjectId));
//               final attendances =
//                   ref.watch(subjectAttendancesProvider(subjectId));
//
//               return Padding(
//                 padding: const EdgeInsets.all(KPaddings.p30),
//                 child: PageView(
//                   onPageChanged: (index) {
//                     navBarKey.currentState?.animateTo(index);
//                   },
//                   controller: pageController,
//                   children: [
//                     RefreshIndicator(
//                       onRefresh: () async {},
//                       child: subject.maybeWhen(
//                         data: (data) => SubjectInfoView(data),
//                         orElse: () =>
//                             const Center(child: CircularProgressIndicator()),
//                       ),
//                     ),
//                     RefreshIndicator(
//                       onRefresh: () async {},
//                       child: attendances.maybeWhen(
//                         skipLoadingOnRefresh: false,
//                         data: (data) => AttendancesView(data),
//                         orElse: () => const Center(
//                           child: CircularProgressIndicator(),
//                         ),
//                       ),
//                     ),
//                     if (user.type == UserType.instructor)
//                       RefreshIndicator(
//                         onRefresh: () async {},
//                         child: attendees.maybeWhen(
//                           skipLoadingOnRefresh: false,
//                           data: (data) => AttendeesView(data),
//                           orElse: () => const Center(
//                             child: CircularProgressIndicator(),
//                           ),
//                         ),
//                       ),
//                   ],
//                 ),
//               );
//             },
//           ),
//         )