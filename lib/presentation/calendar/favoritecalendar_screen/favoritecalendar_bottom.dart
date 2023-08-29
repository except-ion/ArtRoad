import 'package:artroad/core/app_export.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class fTableCalendarBottom extends StatefulWidget {
  final DateTime selectedDay; // 선택된 날짜를 인자로 받도록 수정

  fTableCalendarBottom({required this.selectedDay});

  @override
  _fTableCalendarBottomState createState() => _fTableCalendarBottomState();
}

class _fTableCalendarBottomState extends State<fTableCalendarBottom> {

  @override
  Widget build(BuildContext context) {
    String selectedDate = '${widget.selectedDay.year}.${widget.selectedDay.month}.${widget.selectedDay.day}';
    print(selectedDate);

    return Column(
      children: [
        Padding(
          padding: getPadding(top: 4.5, left: 11),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              '${widget.selectedDay.month}/${widget.selectedDay.day} (${_getDayOfWeek(widget.selectedDay)})',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w700,
                height: 1,
                letterSpacing: -0.36,
              ),
            ),
          ),
        ),

        SizedBox(height: 20),

        Column(
          children: [
            Container(
              width: 381,
              height: 67,
              child: Stack(
                children: [
                  Positioned(
                    left: 20,
                    top: 45,
                    child: Container(
                      width: 181,
                      height: 20,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 1,
                            top: 3,
                            child: InkWell(
                              onTap: () {
                                print("Location button clicked");
                              },
                              child: Row(
                                children: [
                                  Image.asset(
                                    ImageConstant.imageLocation,
                                    width: 17,
                                    height: 17,
                                    color: Color(0xFF939191),
                                  ),
                                  SizedBox(width: 3),
                                  SizedBox(
                                    width: 159,
                                    child: Text(
                                      '송도컨벤시아',
                                      style: TextStyle(
                                        color: Color(0xFF939191),
                                        fontSize: 14,
                                        fontFamily: 'Nunito',
                                        fontWeight: FontWeight.w600,
                                        decoration: TextDecoration.underline,
                                        height: 1,
                                        letterSpacing: -0.28,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 24,
                    top: 21,
                    child: SizedBox(
                      width: 360,
                      height: 24,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '2023.06.24. (토)~2023.06.25. (일)',
                            style: TextStyle(
                              color: Color(0xFF939191),
                              fontSize: 14,
                              fontFamily: 'Nunito',
                              fontWeight: FontWeight.w600,
                              height: 1,
                              letterSpacing: -0.28,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              print("Concert info button clicked");
                            },
                            child: Icon(
                              Icons.keyboard_arrow_right_rounded,
                              color: Color(0xFF939191),
                              size: 30,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    left: 24,
                    top: 0,
                    child: SizedBox(
                      width: 278,
                      height: 29,
                      child: Text(
                        '미스터트롯2 전국투어 콘서트 - 인천',
                        style: TextStyle(
                          color: Color(0xFF176FF2),
                          fontSize: 15,
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.w700,
                          height: 1,
                          letterSpacing: -0.30,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 5,
                    top: 0,
                    child: Image.asset(
                      ImageConstant.imageVerticalLine,
                      color: Color(0xFF176FF2),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  String _getDayOfWeek(DateTime date) {
    final List<String> daysOfWeek = ['일', '월', '화', '수', '목', '금', '토'];

    if (date.weekday == 7 ) return daysOfWeek[0]; // 일요일의 경우 0 인덱스를 사용
    else return daysOfWeek[date.weekday];
  }

}