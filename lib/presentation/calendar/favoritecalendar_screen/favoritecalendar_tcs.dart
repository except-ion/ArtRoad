// --- 날짜 선택 관련 함수 ---
import 'package:artroad/core/app_export.dart';
import 'package:artroad/presentation/calendar/calendar_day_info.dart';
import 'package:artroad/presentation/calendar/favoritecalendar_screen/favoritecalendar_bottom/fcalendar_list_view.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import '../max_num_of_weeks.dart';

typedef OnDaySelected = void Function(
  DateTime selectedDay, DateTime focusedDay);

late final bool Function(DateTime day)? selectedDayPredicate;

// --- 테이블 캘린더 클래스 ---
class fTableCalendarScreen extends StatefulWidget {
  const fTableCalendarScreen({Key? key}) : super(key: key);

  get selectedDay => selectedDay;
  
  @override
  State<fTableCalendarScreen> createState() => _TableCalendarScreenState();
}

class _TableCalendarScreenState extends State<fTableCalendarScreen> {
  final PrimaryColors primaryColors = PrimaryColors();

  DateTime selectedDay = DateTime(
    DateTime.now().year,
    DateTime.now().month,
    DateTime.now().day,
  );

  DateTime focusedDay = DateTime.now();
  bool isOutsideDayUpdated = false;

  bool isFiveWeeks = MaxNumOfWeeks().calculateMaxWeeksInMonth(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent, // 배경색을 투명으로 설정
      child: Column(
        children: [
          Container(
            child: TableCalendar(
              firstDay: DateTime.utc(2023, 1, 1),
              lastDay: DateTime.utc(2023, 12, 31),
              focusedDay: focusedDay,

              locale: 'ko-KR',
              daysOfWeekHeight: 20,

              rowHeight: 42,


              onDaySelected: (DateTime selectedDay, DateTime focusedDay) {
                // 선택된 날짜의 상태를 갱신합니다.
                setState((){
                  this.selectedDay = selectedDay;
                  this.focusedDay = focusedDay;
                });
              },

              calendarBuilders: CalendarBuilders(
                outsideBuilder: (context, day, focusedDay) {
                  isFiveWeeks = MaxNumOfWeeks().calculateMaxWeeksInMonth(focusedDay);
                  return null;// 변경된 값 출력
                },
              ),

              selectedDayPredicate: (DateTime day) {
                // selectedDay 와 동일한 날짜의 모양을 바꿔줍니다.
                return isSameDay(selectedDay, day);
              },

              headerStyle: const HeaderStyle(
                titleCentered: true,
                formatButtonVisible: false,
                titleTextStyle: TextStyle(
                  fontSize: 18.0,
                  color: Colors.black,
                ),
                leftChevronIcon: Icon(
                  Icons.keyboard_arrow_left_rounded,
                  size: 30.0,
                ),
                rightChevronIcon: Icon(
                  Icons.keyboard_arrow_right_rounded,
                  size: 30.0,
                ),
              ),

              calendarStyle: const CalendarStyle(
                canMarkersOverflow: false,
                markersAutoAligned: true,
                markerSize: 10.0,
                markerSizeScale: 10.0,
                markersAlignment: Alignment.bottomCenter,
                markersMaxCount: 1,
                markerDecoration: BoxDecoration(
                  color: Colors.grey,
                  shape: BoxShape.circle,
                ),
                isTodayHighlighted: true,
                todayTextStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 14.0,
                ),
                todayDecoration: BoxDecoration(
                  color: Colors.transparent,
                  shape: BoxShape.circle,
                  border: Border.fromBorderSide(BorderSide(color: Color(0XFF176FF2), width: 1.5)),
                ),
                selectedTextStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 14.0,
                ),
                selectedDecoration: BoxDecoration(
                  color: Color(0XFF176FF2),
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),

          Row(
            children: [
              if (isFiveWeeks)
                Padding(
                    padding: getPadding(top: 100, left: 20),
                  child: CalendarDayInfo(selectedDay: selectedDay),
                ),
              if (!isFiveWeeks)
                Padding(
                  padding: getPadding(top: 0, left: 20),
                  child: CalendarDayInfo(selectedDay: selectedDay),
                ),
            ],
          ),

          fCalendarListView(selectedDay: selectedDay),
        ],
      ),
    );
  }
}