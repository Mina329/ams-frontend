import 'package:ams_frontend/src/features/auth/models/models.dart';
import 'package:ams_frontend/src/features/subjects/view/controllers/attendances_controller.dart';
import 'package:ams_frontend/src/features/subjects/view/widgets/enrolled_list_view.dart';
import 'package:ams_frontend/src/konstants/kcolors.dart';
import 'package:ams_frontend/src/konstants/kdoubles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class AttendeesListView extends ConsumerWidget {
  const AttendeesListView(this.subjectId, {super.key});
  final String subjectId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
// #region providers
    final pAttendancesController = attendancesControllerProvider(subjectId);
// #endregion

// #region ref.watch
    final attendancesState = ref.watch(pAttendancesController);
// #endregion

// #region callbacks
    void onRemove(User attendee) {
      ref.read(pAttendancesController.notifier).removeAttendee(attendee);
    }
// #endregion

    final attendees = attendancesState.attendees;
    final isLoading = attendancesState.isLoading;

    return Column(
      children: [
        if (isLoading)
          LinearProgressIndicator(
            color: KColors.lightCyan,
          ),
        Expanded(
          child: ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(
              height: KSizes.s05,
            ),
            itemBuilder: (context, index) => AttendeeRecord(
              attendees[index],
              actions: [
                SlidableAction(
                  onPressed: (_) => onRemove(attendees[index]),
                  icon: Icons.delete_outlined,
                  borderRadius: BorderRadius.circular(KRadiuses.r05),
                  backgroundColor: KColors.pink,
                )
              ],
            ),
            itemCount: attendees.length,
          ),
        ),
      ],
    );
  }
}
