import 'dart:math';

import 'package:ams_frontend/src/konstants/konstants.dart';
import 'package:ams_frontend/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grouped_list/grouped_list.dart';

import '../../models/attendance_model.dart';

class AttendancesListView extends ConsumerStatefulWidget {
  final List<Attendance> attendances;

  const AttendancesListView(this.attendances, {super.key});

  @override
  ConsumerState<AttendancesListView> createState() =>
      _AttendancesListViewState();
}

class _AttendancesListViewState extends ConsumerState<AttendancesListView>
    with AutomaticKeepAliveClientMixin {
  late final attendances = widget.attendances;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SizedBox(
      child: LayoutBuilder(
        builder: (context, constraints) {
          final height = max(constraints.maxHeight / 15, KSizes.s40 * 2);
          return GroupedListView(
            useStickyGroupSeparators: true,
            elements: attendances,
            groupBy: (element) => element.createAt.day,
            groupHeaderBuilder: (element) => groupSeperator(element),
            stickyHeaderBackgroundColor:
                Theme.of(context).scaffoldBackgroundColor,
            order: GroupedListOrder.DESC,
            itemBuilder: (context, element) => SizedBox(
              height: height,
              child: AttendanceRecord(element),
            ),
          );
        },
      ),
    );
  }

  Widget groupSeperator(Attendance attendance) {
    final width = MediaQuery.of(context).size.width / 4;
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: KPaddings.p10,
        horizontal: width,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(KRadiuses.r20),
        gradient: LinearGradient(
          colors: [
            KColors.gradiant1,
            KColors.gradiant2,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: ProviderScope(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            '${attendance.createAt.day}. ${attendance.createAt.month}, ${attendance.createAt.year}',
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(color: KColors.white),
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class AttendanceRecord extends StatelessWidget {
  const AttendanceRecord(
    this.attendance, {
    super.key,
  });

  final Attendance attendance;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(KRadiuses.r10),
          side: BorderSide(
            color: Theme.of(context).colorScheme.background,
            width: 2,
          )),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: KPaddings.p05,
              ),
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                leading: const CircleAvatar(
                  child: Icon(Icons.person),
                ),
                title: Text(attendance.attendee.name),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: KPaddings.p05,
            ),
            child: Row(
              children: [
                const Spacer(),
                Text(context.l10n.time(attendance.createAt)),
                const SizedBox(width: KSizes.s10),
                const Icon(Icons.date_range_outlined),
              ],
            ),
          )
        ],
      ),
    );
  }
}
