import 'package:artroad/presentation/calendar/mycalendar_screen/mcalendar_bottom/show_schedule_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class mCalendarDialog extends StatefulWidget {
  final DateTime selectedDay; // 선택된 날짜를 인자로 받도록 수정

  mCalendarDialog({required this.selectedDay});

  get alarm => alarm;

  get colors => colors;

  @override
  _mCalendarDialog createState() => _mCalendarDialog();
}

class _mCalendarDialog extends State<mCalendarDialog> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            showScheduleDialog(context, widget.selectedDay);
          },
          child: Stack(
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