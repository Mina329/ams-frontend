import 'package:ams_frontend/src/features/subjects/models/subject_model.dart';
import 'package:ams_frontend/src/konstants/konstants.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import 'subject_event_card_widget.dart';

class SubjectCalenderWidget extends StatefulWidget {
  const SubjectCalenderWidget(this.subjects, {super.key});

  final List<Subject> subjects;

  @override
  State<SubjectCalenderWidget> createState() => _SubjectCalenderWidgetState();
}

class _SubjectCalenderWidgetState extends State<SubjectCalenderWidget> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  List<Subject> _selectedEvents = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TableCalendar<Subject>(
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
          firstDay: DateTime.now(),
          lastDay: DateTime.utc(2030, 3, 14),
          focusedDay: _focusedDay,
          calendarFormat: _calendarFormat,
          selectedDayPredicate: selectedDayPredicate,
          eventLoader: eventLoader,
          onDaySelected: onDaySelected,
          onFormatChanged: onFormatChanged,
          onPageChanged: onPageChanged,
        ),
        if (_selectedDay != null && _selectedEvents.isNotEmpty)
          ListView.builder(
            shrinkWrap: true,
            itemCount: _selectedEvents.length,
            itemBuilder: (context, index) {
              final subject = _selectedEvents[index];
              return SubjectEventCardWidget(subject: subject);
            },
          ),
      ],
    );
  }

  void onFormatChanged(CalendarFormat format) {
    if (_calendarFormat != format) {
      setState(() {
        _calendarFormat = format;
      });
    }
  }

  void onPageChanged(DateTime focusedDay) {
    setState(() {
      _focusedDay = focusedDay;
    });
  }

  List<Subject> eventLoader(DateTime day) {
    List<Subject> subjects = [];

    for (var subject in widget.subjects) {
      final dates = subject.dates
          .where(
            (d) => d.dayOfWeek.isSameAs(day),
          )
          .toList();

      if (dates.isNotEmpty) {
        subjects.add(subject.copyWith(dates: dates));
      }
    }

    return subjects;
  }

  void onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      _selectedDay = selectedDay;
      _selectedEvents = eventLoader(selectedDay);
    });
  }

  bool selectedDayPredicate(DateTime day) {
    return isSameDay(_selectedDay, day);
  }
}
