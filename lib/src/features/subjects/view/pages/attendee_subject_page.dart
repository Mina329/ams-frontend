import 'package:ams_frontend/src/utils/extensions.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../common/common.dart';
import '../../../../konstants/kdoubles.dart';
import '../../../../konstants/kicons.dart';
import '../../../../konstants/kints.dart';
import '../../models/models.dart';
import '../../providers/providers.dart';
import '../view.dart';

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
                        const Center(child: CircularProgressIndicator()),
                  ),
                ),
                RefreshIndicator(
                  onRefresh: () async {},
                  child: attendances.maybeWhen(
                    data: (data) => AttendancesView(data),
                    orElse: () => const Center(
                      child: CircularProgressIndicator(),
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

class SubjectInfoView extends ConsumerWidget {
  final Subject subject;

  const SubjectInfoView(this.subject, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [SubjectCard(subject)],
    );
  }
}

class AttendancesView extends ConsumerWidget {
  final List<Attendance> attendances;

  const AttendancesView(this.attendances, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DataTable(
      columns: [
        DataColumn(
          label: Icon(
            KIcons.attendances,
            color: Theme
                .of(context)
                .scaffoldBackgroundColor,
          ),
          numeric: true,
        ),
        DataColumn(
          label: Text(context.l10n.attendee),
        ),
        DataColumn(
          label: Text('time'.hardcoded),
        ),
      ],
      rows: [
        for (int i = 1; i < attendances.length; i++)
          DataRow(
            cells: [
              DataCell(Text('$i'), placeholder: true),
              DataCell(Text(attendances[i].attendee.name)),
              DataCell(Text(attendances[i].createAt.toString())),
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