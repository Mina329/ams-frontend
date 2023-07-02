import 'package:ams_frontend/src/features/subjects/models/models.dart';
import 'package:ams_frontend/src/utils/extensions.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../common/common.dart';
import '../../../../konstants/kcolors.dart';
import '../../../../konstants/kdoubles.dart';
import '../../../../konstants/kicons.dart';
import '../../../../konstants/kints.dart';
import '../../providers/providers.dart';
import '../view.dart';

class AttendeeSubjectPage extends ConsumerWidget {
  AttendeeSubjectPage({Key? key, required this.subjectId}) : super(key: key);

  final String subjectId;
  final navBarKey = GlobalKey<ConvexAppBarState>();
  final pageController = PageController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final subject = ref.watch(subjectProvider(subjectId));
    return Scaffold(
      appBar: AppBar(
        title: Text(subject.maybeWhen(
          orElse: () => context.l10n.subject,
          data: (data) => data.name,
        )),
      ),
      drawer: const AppDrawerWidget(),
      bottomNavigationBar: ConvexAppBar(
        backgroundColor: Theme.of(context).primaryColor,
        key: navBarKey,
        elevation: KElevations.e10,
        style: TabStyle.react,
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
        padding: const EdgeInsets.all(KPaddings.p30),
        child: PageView(
          onPageChanged: (index) {
            navBarKey.currentState?.animateTo(index);
          },
          controller: pageController,
          children: [
            GenericAsyncBuilder(
              provider: subjectProvider(subjectId),
              data: (Subject subject) => ListView.builder(
                itemCount: KRatios.r100.toInt(),
                itemBuilder: (BuildContext context, int index) =>
                    SubjectInfoView(subject),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
