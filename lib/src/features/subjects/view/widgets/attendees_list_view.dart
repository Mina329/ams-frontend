import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:ams_frontend/src/features/auth/models/models.dart';
import 'package:ams_frontend/src/konstants/konstants.dart';

class AttendeesListView extends ConsumerStatefulWidget {
  final List<User> attendees;

  const AttendeesListView(this.attendees, {super.key});

  @override
  ConsumerState<AttendeesListView> createState() => _AttendeesListViewState();
}

class _AttendeesListViewState extends ConsumerState<AttendeesListView>
    with AutomaticKeepAliveClientMixin {
  late final attendees = widget.attendees;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SizedBox(
      child: ListView.builder(
        itemBuilder: (context, index) => AttendeeRecord(attendees[index]),
        itemCount: attendees.length,
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class AttendeeRecord extends StatelessWidget {
  const AttendeeRecord(
    this.attendee, {
    super.key,
  });

  final User attendee;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: KPaddings.p10),
        child: Row(
          children: [
            Expanded(
              child: ListTile(
                leading: const CircleAvatar(
                  child: Icon(Icons.person),
                ),
                title: Text(attendee.name),
                subtitle: Text(attendee.id),
                trailing: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.check_box_outline_blank_outlined),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
