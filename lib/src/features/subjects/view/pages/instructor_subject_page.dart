import 'package:ams_frontend/src/features/subjects/view/widgets/floating_action_bubble.dart';
import 'package:ams_frontend/src/konstants/kdoubles.dart';
import 'package:ams_frontend/src/utils/extensions.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../common/common.dart';
import '../../../../konstants/kcolors.dart';
import '../../../../konstants/kicons.dart';
import '../../../../konstants/kints.dart';
import '../../providers/providers.dart';
import '../view.dart';
import '../widgets/attendances_table.dart';
import '../widgets/attendees_table.dart';

class InstructorSubjectPAge extends ConsumerWidget {
  InstructorSubjectPAge({Key? key, required this.subjectId}) : super(key: key);

  final String subjectId;
  final navBarKey = GlobalKey<ConvexAppBarState>();
  final pageController = PageController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final subject = ref.watch(subjectProvider(subjectId));
    return Scaffold(
      appBar: AppBar(
        title: Text(subject.maybeWhen(
            orElse: () => "Subject", data: (data) => data.name)),
      ),
      drawer: const AppDrawerWidget(),
      floatingActionButton: FloatingActionBubble(
          onTapFaceID: () {}, onTapQrCode: () {}, onTapId: () {}),
      bottomNavigationBar: ConvexAppBar(
        backgroundColor: Theme.of(context).primaryColor,
        key: navBarKey,
        items: [
          TabItem(icon: KIcons.about, title: 'Info'.hardcoded),
          TabItem(
            icon: KIcons.attendances,
            title: 'Attendances'.hardcoded,
          ),
          TabItem(
            icon: KIcons.attendees,
            title: 'Attendees'.hardcoded,
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
      body: Consumer(
        builder: (context, ref, child) {
          final subject = ref.watch(subjectProvider(subjectId));
          final attendances = ref.watch(subjectAttendancesProvider(subjectId));
          final attendees = ref.watch(subjectAttendeesProvider(subjectId));
          return Padding(
            padding: const EdgeInsets.all(KPaddings.p10),
            child: PageView(
              onPageChanged: (index) {
                navBarKey.currentState?.animateTo(index);
              },
              controller: pageController,
              children: [
                RefreshIndicator(
                  onRefresh: () async {
                    ref.invalidate(subjectProvider(subjectId));
                  },
                  child: ListView.builder(
                    itemCount: KRatios.r100.toInt(),
                    itemBuilder: (BuildContext context, int index) =>
                        subject.maybeWhen(
                      data: (data) => SubjectInfoView(data),
                      orElse: () => Center(
                          child: CircularProgressIndicator(
                              color: KColors.lightBlue)),
                    ),
                  ),
                ),
                RefreshIndicator(
                  onRefresh: () async {
                    ref.invalidate(subjectAttendancesProvider(subjectId));
                  },
                  child: ListView.builder(
                    itemCount: KRatios.r100.toInt(),
                    itemBuilder: (BuildContext context, int index) =>
                        attendances.maybeWhen(
                      data: (data) => AttendancesView(data),
                      orElse: () => Center(
                        child: Center(
                            child: CircularProgressIndicator(
                                color: KColors.lightBlue)),
                      ),
                    ),
                  ),
                ),
                RefreshIndicator(
                  onRefresh: () async {
                    ref.invalidate(subjectAttendeesProvider(subjectId));
                  },
                  child: ListView.builder(
                    itemCount: KRatios.r100.toInt(),
                    itemBuilder: (BuildContext context, int index) =>
                        attendees.maybeWhen(
                      skipLoadingOnRefresh: false,
                      data: (data) => AttendeesView(data),
                      orElse: () => Center(
                        child: Center(
                            child: CircularProgressIndicator(
                                color: KColors.lightBlue)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
