import 'package:ams_frontend/src/utils/utils.dart';
import 'package:flutter/material.dart';

import 'package:ams_frontend/src/features/home/models/todays_attendance_summary.dart';
import 'package:ams_frontend/src/konstants/konstants.dart';

class TodayAttendancesWidget extends StatelessWidget {
  const TodayAttendancesWidget(this.summary, {Key? key}) : super(key: key);

  final TodayAttendanceSummary summary;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: MediaQuery.of(context).size.width,
      child: Card(
        color: KColors.white,
        child: Padding(
          padding: const EdgeInsets.all(KPaddings.p10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                summary.subject.name,
                style: TextStyle(
                  color: KColors.darkBlue,
                  fontSize: KSizes.s20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: KSizes.s10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AttendanceRatioWidget(
                    presentCount: summary.present.length,
                    absentCount: summary.absent.length,
                    totalCount: summary.absent.length + summary.present.length,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class AttendanceRatioWidget extends StatelessWidget {
  final int presentCount;
  final int absentCount;
  final int totalCount;

  const AttendanceRatioWidget({
    super.key,
    required this.presentCount,
    required this.absentCount,
    required this.totalCount,
  });

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width * 0.7;
    const double chartHeight = 16;

    return SizedBox(
      width: width,
      height: chartHeight + 20,
      child: Column(
        children: [
          SizedBox(
            width: width,
            height: chartHeight,
            child: Stack(
              children: [
                Positioned.fill(
                  child: Container(
                    color: Colors.grey[300],
                  ),
                ),
                Positioned(
                  left: 0,
                  top: 0,
                  bottom: 0,
                  width: width * presentCount / totalCount,
                  child: Container(
                    color: Colors.green[500],
                  ),
                ),
                Positioned(
                  right: 0,
                  top: 0,
                  bottom: 0,
                  width: width * absentCount / totalCount,
                  child: Container(
                    color: Colors.red[500],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '$presentCount ${context.l10n.presents}',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.green[500],
                ),
              ),
              Text(
                '$absentCount ${context.l10n.absents}',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.red[500],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
