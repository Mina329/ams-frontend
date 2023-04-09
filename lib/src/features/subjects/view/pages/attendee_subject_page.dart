import 'package:ams_frontend/src/utils/extensions.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../common/common.dart';
import '../../../../konstants/kcolors.dart';
import '../../../../konstants/kdoubles.dart';
import '../../../../konstants/kicons.dart';
import '../../../../konstants/kints.dart';
import '../../models/models.dart';
import '../../providers/providers.dart';
import '../view.dart';
import '../widgets/attendances_table.dart';

class AttendeeSubjectPage extends ConsumerWidget {
  AttendeeSubjectPage(
      {Key? key, required this.subjectId})
      : super(key: key);

  final String subjectId;
  final navBarKey = GlobalKey<ConvexAppBarState>();
  final pageController = PageController();


  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final subject = ref.watch(subjectProvider(subjectId));
    return Scaffold(
      appBar: AppBar(
        title: Text(
            subject.maybeWhen(orElse: () => "Subject", data: (data) => data.name)),
      ),
      drawer: const AppDrawerWidget(),
      bottomNavigationBar: ConvexAppBar(
        backgroundColor: Theme.of(context).primaryColor,
        key: navBarKey,
        items: [
          TabItem(icon: KIcons.about, title: 'info'.hardcoded),
          TabItem(
            icon: KIcons.attendances,
            title: 'attendances'.hardcoded,
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

          return Padding(
            padding: const EdgeInsets.all(KPaddings.p30),
            child: PageView(
              onPageChanged: (index) {
                navBarKey.currentState?.animateTo(index);
              },
              controller: pageController,
              children: [
                RefreshIndicator(
                  onRefresh: () async {},
                  child: subject.maybeWhen(
                    data: (data) => SubjectInfoView(data),
                    orElse: () =>
                        Center(child: CircularProgressIndicator(color: KColors.lightBlue)),
                  ),
                ),
                RefreshIndicator(
                  onRefresh: () async {},
                  child: attendances.maybeWhen(
                    data: (data) => AttendancesView(data),
                    orElse: () =>  Center(
                      child: CircularProgressIndicator(color: KColors.lightBlue),
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
