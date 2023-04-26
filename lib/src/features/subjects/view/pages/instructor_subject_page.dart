import 'package:ams_frontend/src/common/common.dart';
import 'package:ams_frontend/src/features/auth/models/models.dart';
import 'package:ams_frontend/src/features/subjects/models/models.dart';
import 'package:ams_frontend/src/features/subjects/services/services.dart';
import 'package:ams_frontend/src/features/subjects/view/controllers/attendances_controller.dart';
import 'package:ams_frontend/src/features/subjects/view/pages/attendance_report_page.dart';
import 'package:ams_frontend/src/konstants/konstants.dart';
import 'package:ams_frontend/src/utils/utils.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/providers.dart';
import '../view.dart';

// TODO: try sliding_up_panel package
class InstructorSubjectPage extends ConsumerWidget {
  InstructorSubjectPage({Key? key, required this.subjectId}) : super(key: key);

  final String subjectId;
  final navBarKey = GlobalKey<ConvexAppBarState>();
  final pageController = PageController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
// #region providers
    final pControllerProvider = attendancesControllerProvider(subjectId);
    final pSubjectProvider = subjectProvider(subjectId);
    final pSubjectAttendancesProvider = SubjectAttendancesProvider(subjectId);
    final pSubjectAttendeesProvider = subjectAttendeesProvider(subjectId);
// #endregion

// #region ref.watch
    final canSubmit = ref.watch(
      pControllerProvider.select((value) => value.attendees.isNotEmpty),
    );
    final subjectAsync = ref.watch(pSubjectProvider);
    final subject = ref.watch(pSubjectProvider);
// #endregion

// #region ref.listen
    ref.listen(pControllerProvider, (previous, next) {
      if (next.isSubmitted) {
        context.toast('submitted attendances successfully');
      }
    });
// #endregion

// #region callbacks
    void Function()? onSubmit;
    if (canSubmit) {
      onSubmit = () async {
        await ref.read(pControllerProvider.notifier).submit();
      };
    }
    Future<void> onTapFaceID() async {
      await showModalBottomSheet(
        backgroundColor: Colors.transparent,
        isScrollControlled: false,
        elevation: KElevations.e10,
        context: context,
        builder: (context) => CameraAttendance(subjectId),
      );
    }

    Future<void> onTapQrCode() async {
      await showModalBottomSheet(
        backgroundColor: Colors.transparent,
        isScrollControlled: false,
        elevation: KElevations.e10,
        context: context,
        builder: (context) => QrCodeAttendance(subjectId),
      );
    }

    void onGroupSelected(List<Attendance> attendances) {
      subject.whenOrNull(data: (subject) async {
        final pdf = await ref.read(attendanceReportServiceProvider).generate(
              subject: subject,
              attendances: attendances,
            );

        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => AttendanceReportPage(pdfData: pdf),
        ));
      });
    }
// #endregion

    return Scaffold(
      appBar: AppBar(
        title: Text(
          subjectAsync.maybeWhen(
            orElse: () => context.l10n.subjects,
            data: (data) => data.name,
          ),
        ),
      ),
      drawer: const AppDrawerWidget(),
      floatingActionButton: FloatingActionBubble(
        onTapFaceID: onTapFaceID,
        onTapQrCode: onTapQrCode,
        onTapId: () => throw UnimplementedError(), // ! TODO: Not implemented
        onSubmit: onSubmit,
      ),
      bottomNavigationBar: ConvexAppBar(
        backgroundColor: Theme.of(context).primaryColor,
        key: navBarKey,
        style: TabStyle.react,
        elevation: KElevations.e10,
        gradient: LinearGradient(colors: [
          KColors.darkCyan,
          KColors.lightCyan,
          KColors.darkCyan,
          KColors.lightCyan,
          KColors.darkCyan,
        ]),
        items: [
          TabItem(
            activeIcon: KIcons.about,
            icon: KIcons.about_outline,
            title: context.l10n.info,
          ),
          TabItem(
            activeIcon: KIcons.attendances,
            icon: KIcons.attendances_outline,
            title: context.l10n.attendances,
          ),
          TabItem(
            activeIcon: KIcons.attendees,
            icon: KIcons.attendees_outline,
            title: context.l10n.enrolled,
          ),
          TabItem(
            activeIcon: KIcons.take_attendance,
            icon: KIcons.take_attendance_outline,
            title: context.l10n.attendees,
          ),
        ],
        onTap: (index) {
          pageController.animateToPage(
            index,
            duration: KDurations.pageViewNavigation,
            curve: Curves.ease,
          );
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(KPaddings.p10),
        child: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: pageController,
          children: [
            GenericAsyncBuilder(
              withRefreshIndicator: true,
              provider: pSubjectProvider,
              data: (Subject subject) => SubjectInfoView(subject),
            ),
            GenericAsyncBuilder(
              withRefreshIndicator: true,
              provider: pSubjectAttendancesProvider,
              data: (List<Attendance> attendances) => AttendancesListView(
                attendances,
                onGroupSelected: onGroupSelected,
              ),
            ),
            GenericAsyncBuilder(
              withRefreshIndicator: true,
              provider: pSubjectAttendeesProvider,
              data: (List<User> enrolled) => EnrolledListView(enrolled),
            ),
            AttendeesListView(subjectId),
          ],
        ),
      ),
    );
  }
}
