import 'package:ams_frontend/src/features/home/models/todays_attendance_summary.dart';
import 'package:ams_frontend/src/konstants/kints.dart';
import 'package:ams_frontend/src/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../konstants/kcolors.dart';
import '../../../../konstants/kdoubles.dart';
import '../../models/todays_event.dart';

class TodayAttendancesCard extends StatelessWidget {
  const TodayAttendancesCard(this.summary, {Key? key}) : super(key: key);

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
                  AttendanceRatioChart(
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

class Calender extends StatefulWidget {
  const Calender(this.events, {super.key});

  final List<TodayEvent> events;

  @override
  State<Calender> createState() => _CalenderState();
}

class _CalenderState extends State<Calender> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  List<TodayEvent> _selectedEvents = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TableCalendar(
          calendarStyle: CalendarStyle(
            selectedDecoration: const BoxDecoration().copyWith(
              color: KColors.purple,
              shape: BoxShape.circle,
            ),
            todayDecoration: const BoxDecoration().copyWith(
              color: KColors.purple.withAlpha(KAlphas.a80),
              shape: BoxShape.circle,
            ),
            holidayTextStyle: const TextStyle(
              color: Colors.white,
            ),
            outsideTextStyle: const TextStyle(
              color: Colors.black45,
            ),
            weekendTextStyle: const TextStyle(
              color: Colors.white,
            ),
            defaultTextStyle: const TextStyle(
              color: Colors.white,
            ),
          ),
          daysOfWeekStyle: DaysOfWeekStyle(
            weekdayStyle: TextStyle(
              color: KColors.white,
            ),
            weekendStyle: TextStyle(
              color: KColors.white,
            ),
          ),
          headerStyle: HeaderStyle(
            titleTextStyle: TextStyle(
              color: KColors.white,
            ),
            formatButtonTextStyle: TextStyle(
              color: KColors.white,
            ),
            formatButtonDecoration: BoxDecoration(
              border: Border.all(
                color: KColors.white,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(KSizes.s10),
              ),
            ),
            leftChevronIcon: Icon(
              Icons.chevron_left,
              color: KColors.white,
            ),
            rightChevronIcon: Icon(
              Icons.chevron_right,
              color: KColors.white,
            ),
          ),
          firstDay: DateTime.utc(2010, 10, 16),
          lastDay: DateTime.utc(2030, 3, 14),
          focusedDay: _focusedDay,
          calendarFormat: _calendarFormat,
          selectedDayPredicate: (day) {
            return isSameDay(_selectedDay, day);
          },
          eventLoader: (day) {
            return widget.events.where((e) => isSameDay(e.date, day)).toList();
          },
          onDaySelected: (selectedDay, focusedDay) {
            setState(() {
              _selectedDay = selectedDay;
              _selectedEvents = widget.events.where((e) {
                return isSameDay(e.date, selectedDay);
              }).toList();
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
        ),
        if (_selectedDay != null && _selectedEvents.isNotEmpty)
          ListView.builder(
            shrinkWrap: true,
            itemCount: _selectedEvents.length,
            itemBuilder: (context, index) {
              final event = _selectedEvents[index];
              final dt = event.subjects[index].cronExpr.next().time;

              final time =
                  '${context.l10n.dtEEEE(dt)} ${context.l10n.dtjms(dt)}';
              return EventCard(
                  eventName: event.subjects[index].name,
                  eventDescription: time);
            },
          ),
      ],
    );
  }
}

class EventCard extends StatelessWidget {
  EventCard({Key? key, required this.eventName, required this.eventDescription})
      : super(key: key);
  String eventName, eventDescription;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(KRadiuses.r10),
          side: BorderSide(
            color: Theme.of(context).colorScheme.background,
            width: 2,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
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
                    child: Icon(Icons.subject),
                  ),
                  title: Text(eventName),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: KPaddings.p05,
                ),
                child: Row(
                  children: [
                    const Spacer(),
                    Text(eventDescription),
                    const SizedBox(width: KSizes.s10),
                    const Icon(Icons.timer_sharp),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
