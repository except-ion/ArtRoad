import 'package:artroad/core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

// ignore_for_file: must_be_immutable
class FavoritecalendarPage extends StatelessWidget {
  const FavoritecalendarPage({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: appTheme.whiteA700,
        body: Container(
          width: double.maxFinite,
          decoration: AppDecoration.fill,
          child: Container(
            height: getVerticalSize(
              836,
            ),
            width: double.maxFinite,
            padding: getPadding(
              top: 38,
              bottom: 38,
            ),
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Card(
                    clipBehavior: Clip.antiAlias,
                    elevation: 0,
                    margin: getMargin(
                      top: 29,
                      right: 7,
                    ),
                    color: appTheme.blueGray50,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusStyle.customBorderTL10,
                    ),
                    child: Container(
                      height: getVerticalSize(
                        39,
                      ),
                      width: getHorizontalSize(
                        54,
                      ),
                      padding: getPadding(
                        left: 14,
                        top: 6,
                        right: 14,
                        bottom: 6,
                      ),
                      decoration: AppDecoration.fill1.copyWith(
                        borderRadius: BorderRadiusStyle.customBorderTL10,
                      ),
                      child: Stack(
                        children: [
                          CustomImageView(
                            imagePath: ImageConstant.imgToday,
                            height: getSize(
                              26,
                            ),
                            width: getSize(
                              26,
                            ),
                            alignment: Alignment.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: SizedBox(
                    height: getVerticalSize(
                      538,
                    ),
                    width: double.maxFinite,
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: Card(
                            clipBehavior: Clip.antiAlias,
                            elevation: 0,
                            margin: getMargin(
                              top: 30,
                              right: 66,
                            ),
                            color: appTheme.blue100,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadiusStyle.customBorderTL10,
                            ),
                            child: Container(
                              height: getVerticalSize(
                                39,
                              ),
                              width: getHorizontalSize(
                                54,
                              ),
                              padding: getPadding(
                                left: 14,
                                top: 6,
                                right: 14,
                                bottom: 6,
                              ),
                              decoration: AppDecoration.fill2.copyWith(
                                borderRadius:
                                    BorderRadiusStyle.customBorderTL10,
                              ),
                              child: Stack(
                                children: [
                                  CustomImageView(
                                    imagePath: ImageConstant.imgMonthinlove,
                                    height: getSize(
                                      26,
                                    ),
                                    width: getSize(
                                      26,
                                    ),
                                    alignment: Alignment.center,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        CustomImageView(
                          imagePath: ImageConstant.imgCalendar,
                          height: getVerticalSize(
                            470,
                          ),
                          width: getHorizontalSize(
                            428,
                          ),
                          radius: BorderRadius.circular(
                            getHorizontalSize(
                              8,
                            ),
                          ),
                          alignment: Alignment.bottomCenter,
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: getPadding(
                              left: 34,
                            ),
                            child: Text(
                              "ArtRoad",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: theme.textTheme.displaySmall,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 30,
                          left: 20,
                          right: 20,
                          child: TableCalendarScreen(),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// --- 날짜 선택 관련 함수 ---
typedef OnDaySelected = void Function(
    DateTime selectedDay, DateTime focusedDay);

late final bool Function(DateTime day)? selectedDayPredicate;

// --- 테이블 캘린더 클래스 ---
class TableCalendarScreen extends StatefulWidget {
  const TableCalendarScreen({Key? key}) : super(key: key);

  @override
  State<TableCalendarScreen> createState() => _TableCalendarScreenState();
}

class _TableCalendarScreenState extends State<TableCalendarScreen> {

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
            fontSize: 20.0,
            color: Colors.black,
          ),
          leftChevronIcon: const Icon(
            Icons.keyboard_arrow_left_rounded,
            size: 40.0,
          ),
          rightChevronIcon: const Icon(
            Icons.keyboard_arrow_right_rounded,
            size: 40.0,
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
            color: Colors.white,
            fontSize: 16.0,
          ),
          todayDecoration: const BoxDecoration(
            color: Colors.blue,
            shape: BoxShape.circle,
          ),
          selectedTextStyle: const TextStyle(
            color: Colors.black,
            fontSize: 16.0,
          ),
          selectedDecoration: const BoxDecoration(
            color: Colors.blue,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}

