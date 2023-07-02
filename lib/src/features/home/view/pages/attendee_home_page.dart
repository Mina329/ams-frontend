import 'package:ams_frontend/src/common/common.dart';
import 'package:ams_frontend/src/features/home/view/widgets/widgets.dart';
import 'package:ams_frontend/src/features/subjects/models/models.dart';
import 'package:ams_frontend/src/features/subjects/providers/providers.dart';
import 'package:ams_frontend/src/konstants/konstants.dart';
import 'package:ams_frontend/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AttendeeHomePage extends ConsumerWidget {
  const AttendeeHomePage(this.attendeeId, {Key? key}) : super(key: key);

  final String attendeeId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GenericAsyncBuilder(
      withRefreshIndicator: true,
      provider: userSubjectsProvider,
      data: (List<Subject> subjects) => SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: KSizes.s10,
              ),
              Text(
                context.l10n.subjectCalendar,
                style: TextStyle(
                  fontSize: KSizes.s25,
                  color: KColors.white,
                ),
              ),
              SubjectCalenderWidget(subjects),
            ],
          ),
        ),
      ),
    );
  }
}
