import 'package:ams_frontend/src/common/common.dart';
import 'package:ams_frontend/src/features/home/models/todays_attendance_summary.dart';
import 'package:ams_frontend/src/features/home/providers/today_attendance_summaries_provider.dart';
import 'package:ams_frontend/src/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../konstants/kcolors.dart';
import '../../../../konstants/kdoubles.dart';
import '../widgets/home_widget.dart';

class InstructorHomePage extends ConsumerWidget {
  const InstructorHomePage(this.instructorId, {Key? key}) : super(key: key);

  final String instructorId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(KPaddings.p20),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: KSizes.s60,
            child: Text(
              context.l10n.todayAttendence,
              style: TextStyle(
                fontSize: KSizes.s25,
                color: KColors.white,
              ),
            ),
          ),
          Expanded(
            child: GenericAsyncBuilder(
              withRefreshIndicator: true,
              provider: todayAttendanceSummariesProvider(instructorId),
              data: (List<TodayAttendanceSummary> summaries) =>
                  ListView.builder(
                itemBuilder: (
                  context,
                  index,
                ) =>
                    TodayAttendancesCard(summaries[index]),
                itemCount: summaries.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
