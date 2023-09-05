import 'dart:core';
import 'dart:ui';

class mCalendarItems {
  String? schid; // 일정 ID
  String schname; // 일정 이름
  String schdate;
  String? schlink; // 일정 링크
  String schalarm;
  Color schcolor;

  mCalendarItems(this.schid, this.schname,
      this.schdate, this.schlink, this.schalarm, this.schcolor);
}

//String schdate = CalendarDayInfo(selectedDay: mTableCalendarScreen().selectedDay).selectedDate; // 일정 날짜
//String schalarm = mCalendarDialog(selectedDay: mTableCalendarScreen().selectedDay).alarm[0]; // 알람 여부
//Color schcolor = mCalendarDialog(selectedDay: mTableCalendarScreen().selectedDay).colors[0]; // 일정 색상
