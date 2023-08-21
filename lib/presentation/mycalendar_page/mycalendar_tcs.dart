// --- 날짜 선택 관련 함수 ---
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../theme/theme_helper.dart';

typedef OnDaySelected = void Function(
    DateTime selectedDay, DateTime focusedDay);

late final bool Function(DateTime day)? selectedDayPredicate;

// --- 테이블 캘린더 클래스 ---
class mTableCalendarScreen extends StatefulWidget {
  const mTableCalendarScreen({Key? key}) : super(key: key);

  @override
  State<mTableCalendarScreen> createState() => _TableCalendarScreenState();
}

class _TableCalendarScreenState extends State<mTableCalendarScreen> {
  final PrimaryColors primaryColors = PrimaryColors();

  DateTime selectedDay = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );

  DateTime focusedDay = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent, // 배경색을 투명으로 설정
      child: TableCalendar(
        // locale: 'ko_KR',
        firstDay: DateTime.utc(2023, 1, 1),
        lastDay: DateTime.utc(2023, 12, 31),
        focusedDay: focusedDay,

        locale: 'ko-KR',
        daysOfWeekHeight: 20,

        onDaySelected: (DateTime selectedDay, DateTime focusedDay) {
          // 선택된 날짜의 상태를 갱신합니다.
          setState((){
            this.selectedDay = selectedDay;
            this.focusedDay = focusedDay;
          });
        },
        selectedDayPredicate: (DateTime day) {
          // selectedDay 와 동일한 날짜의 모양을 바꿔줍니다.
          return isSameDay(selectedDay, day);
        },

        headerStyle: HeaderStyle(
          titleCentered: true,
          formatButtonVisible: false,
          titleTextStyle: const TextStyle(
            fontSize: 18.0,
            color: Colors.black,
          ),
          leftChevronIcon: const Icon(
            Icons.keyboard_arrow_left_rounded,
            size: 30.0,
          ),
          rightChevronIcon: const Icon(
            Icons.keyboard_arrow_right_rounded,
            size: 30.0,
          ),
        ),

        calendarStyle: CalendarStyle(
          canMarkersOverflow: false,
          markersAutoAligned: true,
          markerSize: 10.0,
          markerSizeScale: 10.0,
          markersAlignment: Alignment.bottomCenter,
          markersMaxCount: 1,
          markerDecoration: const BoxDecoration(
            color: Colors.grey,
            shape: BoxShape.circle,
          ),
          isTodayHighlighted: true,
          todayTextStyle: const TextStyle(
            color: Colors.black,
            fontSize: 16.0,
          ),
          todayDecoration: const BoxDecoration(
            color: Colors.transparent,
            shape: BoxShape.circle,
            border: Border.fromBorderSide(BorderSide(color: Color(0XFF176FF2), width: 1.5)),
          ),
          selectedTextStyle: const TextStyle(
            color: Colors.white,
            fontSize: 16.0,
          ),
          selectedDecoration: const BoxDecoration(
            color: Color(0XFF176FF2),
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}