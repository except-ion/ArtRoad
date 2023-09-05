import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'day_of_week.dart';

class CalendarDayInfo extends StatefulWidget {
  final DateTime selectedDay; // 선택된 날짜를 인자로 받도록 수정

  CalendarDayInfo({required this.selectedDay});

  String get selectedDate => selectedDate;

  @override
  _CalendarDayInfo createState() => _CalendarDayInfo();
}

class _CalendarDayInfo extends State<CalendarDayInfo> {
  DayOfWeek dayOfWeek = DayOfWeek();

  @override
  Widget build(BuildContext context) {
    String selectedDate = '${widget.selectedDay.year}.${widget.selectedDay.month}.${widget.selectedDay.day}';

    if (widget.selectedDay.month < 10 && widget.selectedDay.day > 10)
      selectedDate = '${widget.selectedDay.year}.0${widget.selectedDay.month}.${widget.selectedDay.day}';
    if (widget.selectedDay.month > 10 && widget.selectedDay.day < 10)
      selectedDate = '${widget.selectedDay.year}.${widget.selectedDay.month}.0${widget.selectedDay.day}';
    if (widget.selectedDay.month < 10 && widget.selectedDay.day < 10)
      selectedDate = '${widget.selectedDay.year}.0${widget.selectedDay.month}.0${widget.selectedDay.day}';
    if (widget.selectedDay.month > 10 && widget.selectedDay.day > 10)
      selectedDate = '${widget.selectedDay.year}.${widget.selectedDay.month}.${widget.selectedDay.day}';

    print(selectedDate);

    return Row(
      children: [
        Text(
          '${widget.selectedDay.month}/${widget.selectedDay.day} (${dayOfWeek.getDayOfWeek(widget.selectedDay)})',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w700,
            height: 1,
            letterSpacing: -0.36,
          ),
        ),
      ],
    );
  }
}