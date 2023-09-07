import 'dart:core';
import 'dart:ui';

class mCalendarItems {
  String scheduleId;
  String schname; // 일정 이름
  DateTime schdate;
  String? schlink; // 일정 링크
  String schalarm;
  Color schcolor;

  mCalendarItems(
    this.scheduleId,
    this.schname,
    this.schdate, 
    this.schlink, 
    this.schalarm, 
    this.schcolor
  );
}