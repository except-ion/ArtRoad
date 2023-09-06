import 'package:artroad/presentation/calendar/mycalendar_screen/mcalendar_bottom/mcalendar_show_schedule_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class mCalendarScheduleAdd extends StatefulWidget {
  final DateTime selectedDay; // 선택된 날짜를 인자로 받도록 수정

  const mCalendarScheduleAdd({super.key, required this.selectedDay});

  get alarm => alarm;

  get colors => colors;

  @override
  _mCalendarScheduleAdd createState() => _mCalendarScheduleAdd();
}

class _mCalendarScheduleAdd extends State<mCalendarScheduleAdd> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            showScheduleDialog(context, widget.selectedDay);
          },
          child: const Stack(
            children: [
              Icon(
                Icons.circle,
                color: Color(0xFF176FF2),
                size: 50,
              ),
              Positioned(
                top: 10,
                left: 10,
                child: Icon(
                  Icons.add_rounded,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}