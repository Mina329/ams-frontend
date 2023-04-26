import 'package:ams_frontend/src/features/subjects/repositories/repositores.dart';
import 'package:ams_frontend/src/konstants/konstants.dart';
import 'package:ams_frontend/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../models/attendance_model.dart';
import '../view.dart';

class AttendancesListView extends ConsumerStatefulWidget {
  final List<Attendance> attendances;

  final void Function(List<Attendance> attendances)? onGroupSelected;

  const AttendancesListView(
    this.attendances, {
    super.key,
    this.onGroupSelected,
  });

  @override
  ConsumerState<AttendancesListView> createState() =>
      _AttendancesListViewState();
}

class _AttendancesListViewState extends ConsumerState<AttendancesListView>
    with AutomaticKeepAliveClientMixin {
  late final attendances = widget.attendances;

  void Function(DateTime date)? onTap;

  @override
  void initState() {
    super.initState();
    if (widget.onGroupSelected != null) {
      onTap = (DateTime date) {
        final group = attendances
            .where(
              (a) => isSameDay(a.createAt, date),
            )
            .toList();
        widget.onGroupSelected?.call(group);
      };
    }
  }

  @override
  Widget build(BuildContext context) {
    Future<void> onRemove(Attendance attendance) async {
      final repo = await ref.read(attendancesRepositoryProvider.future);
      await repo.deleteAttendance(attendance.id);
      setState(() {
        widget.attendances.removeWhere((e) => e == attendance);
      });
    }

    super.build(context);
    return SizedBox(
      child: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            child: GroupedListView(
              useStickyGroupSeparators: true,
              elements: attendances,
              groupBy: (element) => element.createAt.day,
              groupHeaderBuilder: (element) => groupSeperator(element),
              stickyHeaderBackgroundColor:
                  Theme.of(context).scaffoldBackgroundColor,
              order: GroupedListOrder.DESC,
              itemBuilder: (context, element) => AttendanceRecord(
                element,
                actions: [
                  SlidableAction(
                    onPressed: (_) => onRemove(element),
                    icon: Icons.delete_outlined,
                    borderRadius: BorderRadius.circular(KRadiuses.r05),
                    backgroundColor: KColors.pink,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget groupSeperator(Attendance attendance) {
    final width = MediaQuery.of(context).size.width / 4;
    return InkWell(
      onTap: onTap == null ? null : () => onTap?.call(attendance.createAt),
      child: Container(
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
              context.l10n.dtyMMMd(attendance.createAt),
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(color: KColors.white),
            ),
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
