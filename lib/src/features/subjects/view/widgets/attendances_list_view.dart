import 'dart:math';

import 'package:ams_frontend/src/konstants/konstants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
          final height = max(constraints.maxHeight / 15, KSizes.s100);
          return ListView.builder(
            itemBuilder: (context, index) => SizedBox(
              height: height,
              child: Card(
                child: Row(
                  children: [
                    Expanded(
                      child: ListTile(
                        leading: const CircleAvatar(
                          child: Icon(Icons.person),
                        ),
                        title: Text(attendances[index].attendee.name),
                      ),
                    ),
                    const Spacer(),
                    Text('${attendances[index].createAt}'),
                    const Spacer(),
                    const Icon(Icons.date_range_outlined),
                    const SizedBox(width: KSizes.s10),
                  ],
                ),
              ),
            ),
            itemCount: attendances.length,
          );
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
