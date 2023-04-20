import 'package:ams_frontend/src/konstants/konstants.dart';
import 'package:ams_frontend/src/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../models/models.dart';

class AttendanceRecord extends StatelessWidget {
  const AttendanceRecord(
    this.attendance, {
    super.key,
    this.actions,
  });

  final Attendance attendance;

  final List<SlidableAction>? actions;

  @override
  Widget build(BuildContext context) {
    var card = Card(
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius:
            actions?.first.borderRadius ?? BorderRadius.circular(KRadiuses.r10),
        side: BorderSide(
          color: Theme.of(context).colorScheme.background,
          width: 2,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: KPaddings.p10,
            ),
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const CircleAvatar(
                child: Icon(Icons.person),
              ),
              title: Text(attendance.attendee.name),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: KPaddings.p05,
            ),
            child: Row(
              children: [
                const Spacer(),
                Text(context.l10n.dtjms(attendance.createAt)),
                const SizedBox(width: KSizes.s10),
                const Icon(Icons.date_range_outlined),
              ],
            ),
          )
        ],
      ),
    );
    return actions == null
        ? card
        : Slidable(
            startActionPane: ActionPane(
              extentRatio: 0.2,
              motion: const ScrollMotion(),
              children: actions!,
            ),
            child: card,
          );
  }
}
