import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../../core/utils/size_utils.dart';
import '../../../theme/theme_helper.dart';
import '../calendar_day_info.dart';
import '../max_num_of_weeks.dart';
import 'mcalendar_bottom/mcalendar_schedule_add.dart';
import 'mcalendar_bottom/mcalendar_list_view.dart';

typedef OnDaySelected = void Function(
    DateTime selectedDay, DateTime focusedDay);

late final bool Function(DateTime day)? selectedDayPredicate;

// --- 테이블 캘린더 클래스 ---
class mTableCalendarScreen extends StatefulWidget {
  const mTableCalendarScreen({Key? key}) : super(key: key);

  get selectedDay => selectedDay;

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

  bool isFiveWeeks = MaxNumOfWeeks().calculateMaxWeeksInMonth(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
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
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // if (isFiveWeeks)
                  //   Padding(
                  //     padding: getPadding(top: 100, left: 20),
                  //     child: CalendarDayInfo(selectedDay: selectedDay),
                  //   ),
                  // if (!isFiveWeeks)
                  //   Padding(
                  //     padding: getPadding(top: 0, left: 20),
                  //     child: CalendarDayInfo(selectedDay: selectedDay),
                  //   ),
                  Padding(
                      padding: getPadding(top: 100, left: 20),
                    child: CalendarDayInfo(selectedDay: selectedDay),
                  ),
                ],
              ),

              mCalendarListView(selectedDay: selectedDay),
            ],
          ),
        ),
        Positioned(
          top: 360,
          left: 336,
            child: mCalendarScheduleAdd(selectedDay: selectedDay),
        ),
      ],
    );
  }
}