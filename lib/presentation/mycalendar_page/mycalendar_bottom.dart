import 'package:artroad/core/app_export.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyCalendarBottom extends StatefulWidget {
  final DateTime selectedDay; // 선택된 날짜를 인자로 받도록 수정

  MyCalendarBottom({required this.selectedDay});

  @override
  _MyCalendarBottom createState() => _MyCalendarBottom();
}

class _MyCalendarBottom extends State<MyCalendarBottom> {

  void _showScheduleDialog() {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
        ),
      ),
      builder: (BuildContext context) {
        String selectedValue = '이벤트 당일 자정';
        List<bool> isToggledList = [false, false, false, false, false, false, false];
        List<Color> colors = [
          Colors.red,
          Colors.orange,
          Colors.yellow,
          Colors.green,
          Color(0xFF176FF2),
          Colors.purple,
          Colors.pink,
        ];

        print(MediaQuery.of(context).viewInsets.bottom);
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter bottomState) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 10, left: 20, right: 20, bottom: 30),
                child: Container(
                  //키보드 창 크기만큼 컨텐츠 올리기
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Icon(
                                    Icons.close_rounded,
                                    color: Color(0xFFC7C7CC),
                                    size: 40,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: Icon(
                                    Icons.check_rounded,
                                    color: Color(0xFFC7C7CC),
                                    size: 40,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),

                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: getPadding(left: 10),
                              child: Text(
                                '${widget.selectedDay.month}월 ${widget.selectedDay.day}일 (${_getDayOfWeek(widget.selectedDay)})',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 6,
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Padding(
                                      padding: getPadding(left: 10),
                                      child: TextFormField(
                                        cursorColor: Colors.black,
                                        cursorWidth: 1.5,
                                        showCursor: true,

                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 30,
                                            fontWeight: FontWeight.w700,
                                        ),

                                        decoration: const InputDecoration(
                                          border: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                  ),
                              ),
                              Expanded(
                                flex: 1,
                                  child: Align(
                                    alignment: Alignment.topRight,
                                    child: Icon(
                                      Icons.delete_rounded,
                                      color: Color(0xFFC7C7CC),
                                      size: 25,
                                    ),
                                  ),
                              )
                            ],
                          ),
                          Container(
                            height: 1.5,
                            width: 370,
                            color: Color(0xFFC7C7CC),
                          ),

                          SizedBox(height: 10),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.link_rounded,
                                color: Colors.black,
                                size: 25,
                              ),
                              SizedBox(width: 7),
                              Expanded(
                                child: TextFormField(
                                  cursorColor: Colors.black,
                                  cursorWidth: 1.5,
                                  showCursor: false,

                                  decoration: const InputDecoration(
                                    hintText: '링크 추가',
                                    hintStyle: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: 10),

                          Column(
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.alarm_rounded,
                                    color: Colors.black,
                                    size: 25,
                                  ),
                                  SizedBox(width: 7),
                                  Text(
                                    '알림',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),

                              SizedBox(height: 10),

                              Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                  height: 43,
                                  width: 161,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10), // 모서리 둥글기 설정
                                    border: Border.all(color: Color(0xFF176FF2), width: 1.5), // 테두리 설정
                                  ),
                                  child: Padding(
                                    padding: getPadding(left: 8),
                                    child: DropdownButton<String>(
                                      value: selectedValue, // 현재 선택된 값
                                      onChanged: (String? newValue) {
                                        bottomState(() { // bottomState를 사용하여 상태를 업데이트합니다
                                          setState(() {
                                            selectedValue = newValue!;
                                          }); // 선택된 값을 업데이트
                                        });
                                      },
                                      underline: SizedBox(), // 밑줄 제거
                                      icon: Padding(
                                        padding: EdgeInsets.only(left: 25), // 아이콘 왼쪽 패딩 설정
                                        child: Icon(Icons.arrow_drop_down),
                                      ), // 드롭다운 아이콘
                                      items: <String>[
                                        '없음',
                                        '이벤트 당일 자정',
                                        '1일 전',
                                        '2일 전',
                                        '1주일 전',
                                      ].map<DropdownMenuItem<String>>((String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(
                                            value,
                                            style: TextStyle(fontSize: 14), // 아이템 글씨 크기 설정
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: 10),

                          Column(
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.invert_colors_on_rounded,
                                    color: Colors.black,
                                    size: 25,
                                  ),
                                  SizedBox(width: 7),
                                  Text(
                                    '색깔',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),

                              SizedBox(height: 10),

                              Row(
                                children: List.generate(
                                  isToggledList.length,
                                      (index) {
                                    return InkWell(
                                      onTap: () {
                                        bottomState(() {
                                          setState(() {
                                            isToggledList = List.generate(isToggledList.length, (i) => i == index ? !isToggledList[i] : false);
                                          });
                                        });
                                      },
                                      child: Container(
                                        width: 25,
                                        height: 25,
                                        child: Icon(
                                          isToggledList[index] ? Icons.check_box_rounded : Icons.square_rounded,
                                          color: colors[index], // 컬러 리스트 사용
                                          size: 25,
                                        ),
                                      ),
                                    );
                                  },
                                ).map<Widget>((widget) {
                                  return Row(
                                    children: [
                                      widget,
                                      SizedBox(width: 10), // 버튼 간 간격 조절
                                    ],
                                  );
                                }).toList(),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
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
            Expanded(
              child: Align(
                alignment: Alignment.topRight,
                child: InkWell(
                  onTap: () {
                    _showScheduleDialog();
                  },
                  child: Icon(
                    Icons.add_circle_rounded,
                    color: Color(0XFF176FF2),
                    size: 50,
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }

  String _getDayOfWeek(DateTime date) {
    final List<String> daysOfWeek = ['일', '월', '화', '수', '목', '금', '토'];
    return daysOfWeek[date.weekday - 1];
  }
}