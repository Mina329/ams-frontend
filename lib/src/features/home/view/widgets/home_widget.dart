import 'package:ams_frontend/src/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../konstants/kcolors.dart';
import '../../../../konstants/kdoubles.dart';

class TodayAttendanceCard extends StatelessWidget {
  const TodayAttendanceCard({Key? key}) : super(key: key);

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
                  "Subject Name",
                  style: TextStyle(
                      color: KColors.darkBlue,
                      fontSize: KSizes.s20,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: KSizes.s10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    AttendanceRatioChart(
                      presentCount: 24,
                      absentCount: 6,
                      totalCount: 30,
                    )
                  ],
                )
              ],
            ),
          ),
        ));
  }
}

class AttendanceRatioChart extends StatelessWidget {
  final int presentCount;
  final int absentCount;
  final int totalCount;

  const AttendanceRatioChart({
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
                '$presentCount Present',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.green[500],
                ),
              ),
              Text(
                '$absentCount Absent',
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

class Calender extends StatefulWidget {
  final Map<DateTime, String> eventDescriptions;

  const Calender({super.key, required this.eventDescriptions});

  @override
  State<Calender> createState() => _CalenderState();
}

class _CalenderState extends State<Calender> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      firstDay: DateTime.utc(2010, 10, 16),
      lastDay: DateTime.utc(2030, 3, 14),
      focusedDay: _focusedDay,
      calendarFormat: _calendarFormat,
      selectedDayPredicate: (day) {
        return isSameDay(_selectedDay, day);
      },
      eventLoader: (day) {
        List<String> events = [];
        widget.eventDescriptions.forEach((key, value) {
          if (isSameDay(key, day)) {
            events.add(value);
          }
        });
        return events;
      },
      onDaySelected: (selectedDay, focusedDay) {
        if (!isSameDay(_selectedDay, selectedDay)) {
          setState(() {
            _selectedDay = selectedDay;
            _focusedDay = focusedDay;
          });
        }

        widget.eventDescriptions.forEach((key, value) {
          if (isSameDay(key, focusedDay)) {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text(context.l10n.details),
                  content: Text('day: $key, event: $value'),
                );
              },
            );
          }
        });
      },
      onFormatChanged: (format) {
        if (_calendarFormat != format) {
          setState(() {
            _calendarFormat = format;
          });
        }
      },
      onPageChanged: (focusedDay) {
        _focusedDay = focusedDay;
      },
    );
  }
}
