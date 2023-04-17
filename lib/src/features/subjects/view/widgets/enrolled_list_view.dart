import 'package:ams_frontend/src/common/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:ams_frontend/src/features/auth/models/models.dart';
import 'package:ams_frontend/src/konstants/konstants.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class EnrolledListView extends ConsumerStatefulWidget {
  final List<User> enrolled;

  const EnrolledListView(this.enrolled, {super.key});

  @override
  ConsumerState<EnrolledListView> createState() => _EnrolledListViewState();
}

class _EnrolledListViewState extends ConsumerState<EnrolledListView>
    with AutomaticKeepAliveClientMixin {
  late final enrolled = widget.enrolled;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SizedBox(
      child: ListView.separated(
        separatorBuilder: (context, index) =>
            const SizedBox(height: KSizes.s10),
        itemBuilder: (context, index) => AttendeeRecord(enrolled[index]),
        itemCount: enrolled.length,
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

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
