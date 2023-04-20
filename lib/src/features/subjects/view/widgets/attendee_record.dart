import 'package:ams_frontend/src/common/common.dart';
import 'package:ams_frontend/src/features/auth/models/models.dart';
import 'package:ams_frontend/src/konstants/konstants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class AttendeeRecord extends StatelessWidget {
  AttendeeRecord(
    this.attendee, {
    this.actions,
    super.key,
  }) : assert(actions == null || actions.isNotEmpty);

  final User attendee;

  final List<SlidableAction>? actions;

  @override
  Widget build(BuildContext context) {
    final card = Card(
      shape: RoundedRectangleBorder(
        borderRadius:
            actions?.first.borderRadius ?? BorderRadius.circular(KRadiuses.r10),
        side: BorderSide(
          color: Theme.of(context).colorScheme.background,
          width: 2,
        ),
      ),
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: KPaddings.p10,
        ),
        child: Row(
          children: [
            Expanded(
              child: ListTile(
                leading: const CircleAvatar(
                  child: Icon(Icons.person),
                ),
                title: CopiableText(attendee.name),
                subtitle: CopiableText(attendee.id),
              ),
            ),
          ],
        ),
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
