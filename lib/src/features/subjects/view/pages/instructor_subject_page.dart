import 'package:ams_frontend/src/common/common.dart';
import 'package:ams_frontend/src/features/auth/models/models.dart';
import 'package:ams_frontend/src/features/subjects/models/models.dart';
import 'package:ams_frontend/src/features/subjects/view/pages/qr_scanner_page.dart';
import 'package:ams_frontend/src/features/subjects/view/widgets/floating_action_bubble.dart';
import 'package:ams_frontend/src/konstants/konstants.dart';
import 'package:ams_frontend/src/utils/extensions.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../providers/providers.dart';
import '../view.dart';
import '../widgets/attendances_list_view.dart';
import '../widgets/attendees_list_view.dart';

class InstructorSubjectPAge extends ConsumerWidget {
  InstructorSubjectPAge({Key? key, required this.subjectId}) : super(key: key);

  final String subjectId;
  final navBarKey = GlobalKey<ConvexAppBarState>();
  final pageController = PageController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final subjectAsync = ref.watch(subjectProvider(subjectId));
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
        onTapFaceID: () {},
        onTapQrCode: () {
          Navigator.of(context).push(QrScannerPage.route(subjectId));
        },
        onTapId: () {},
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
          onPageChanged: (index) {
            navBarKey.currentState?.animateTo(index);
          },
          controller: pageController,
          children: [
            AsyncDataBuilder(
              withRefreshIndicator: true,
              provider: subjectProvider(subjectId),
              builder: (Subject subject) => ListView.builder(
                itemCount: KRatios.r100.toInt(),
                itemBuilder: (BuildContext context, int index) =>
                    SubjectInfoView(subject),
              ),
            ),
            AsyncDataBuilder(
              withRefreshIndicator: true,
              provider: SubjectAttendancesProvider(subjectId),
              builder: (List<Attendance> attendances) =>
                  AttendancesListView(attendances),
            ),
            AsyncDataBuilder(
              withRefreshIndicator: true,
              provider: subjectAttendeesProvider(subjectId),
              builder: (List<User> attendees) => AttendeesListView(attendees),
            ),
          ],
        ),
      ),
    );
  }
}
