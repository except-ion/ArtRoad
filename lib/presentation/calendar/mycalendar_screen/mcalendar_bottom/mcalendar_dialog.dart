import 'package:artroad/core/app_export.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class mCalendarDialog extends StatefulWidget {
  final DateTime selectedDay; // 선택된 날짜를 인자로 받도록 수정

  mCalendarDialog({required this.selectedDay});

  get alarm => alarm;

  get colors => colors;

  @override
  _mCalendarDialog createState() => _mCalendarDialog();
}

class _mCalendarDialog extends State<mCalendarDialog> {
  BuildContext? _mainDialogContext;
  BuildContext? _nestedDialogContext;

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
        List<bool> aToggledList = [false, true, false, false, false,];
        List<String> alarm = [
          '없음',
          '이벤트 당일 자정',
          '1일 전',
          '2일 전',
          '1주일 전',
        ];
        String selectedAlarm = alarm[1]; // 초기 선택 값

        List<bool> isToggledList = [false, false, false, false, true, false, false];
        List<Color> colors = [
          Colors.red,
          Colors.orange,
          Colors.yellow,
          Colors.green,
          Color(0xFF176FF2),
          Colors.purple,
          Colors.pink,
        ];
        Color selectedColor = colors[4]; // 초기 선택 값

        print(MediaQuery.of(context).viewInsets.bottom);
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter bottomState) {
            _mainDialogContext = context; // 메인 다이얼로그의 BuildContext 저장
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
                                child: InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: Icon(
                                      Icons.close_rounded,
                                      color: Color(0xFFC7C7CC),
                                      size: 40,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                    Fluttertoast.showToast(
                                      msg: '일정이 추가되었습니다.',
                                      toastLength: Toast.LENGTH_SHORT,
                                      backgroundColor: Colors.grey,
                                      textColor: Colors.white,
                                      fontSize: 16.0,
                                    );
                                    // --- 일정 추가 로직 구현 ---

                                  },
                                  child: Align(
                                    alignment: Alignment.topRight,
                                    child: Icon(
                                      Icons.check_rounded,
                                      color: Color(0xFFC7C7CC),
                                      size: 40,
                                    ),
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
                                child: InkWell(
                                  onTap: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        _nestedDialogContext = context;
                                        return Dialog(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(30.0),
                                          ),
                                          child: Container(
                                            constraints: BoxConstraints(
                                              maxWidth: 300, // 최대 너비 조절
                                            ),
                                            padding: EdgeInsets.all(20),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Stack(
                                                      children: [
                                                        Icon(
                                                          Icons.circle,
                                                          color: Color(0xFFC7C7CC),
                                                          size: 25,
                                                        ),
                                                        Positioned(
                                                          top: 5,
                                                          left: 5,
                                                          child: Icon(
                                                            Icons.question_mark_rounded,
                                                            color: Colors.white,
                                                            size: 15,
                                                          ),
                                                        ),
                                                      ],
                                                    ),

                                                    SizedBox(width: 5),

                                                    Text(
                                                      '일정 삭제',
                                                      style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 20,
                                                        fontWeight: FontWeight.w600,
                                                      ),
                                                    ),
                                                  ],
                                                ),

                                                SizedBox(height: 10),

                                                Text(
                                                  '등록한 일정을 삭제하시겠어요?',
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.black54,
                                                  ),
                                                ),

                                                SizedBox(height: 20),

                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    InkWell(
                                                        onTap: () {
                                                          Navigator.pop(context);
                                                          // 클릭 이벤트에 따른 로직 작성
                                                        },
                                                        child: Container(
                                                          decoration: BoxDecoration(
                                                            color: Color(0xFFC7C7CC), // 배경색
                                                            borderRadius: BorderRadius.circular(30),
                                                            boxShadow: [
                                                              BoxShadow(
                                                                color: Colors.black.withOpacity(0.2), // 그림자 색상
                                                                spreadRadius: 1, // 그림자 확산 범위
                                                                blurRadius: 2, // 그림자 흐림 정도
                                                                offset: Offset(0, 3), // 그림자 위치 (x, y)
                                                              ),
                                                            ],
                                                          ),
                                                          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                                                          child: Text(
                                                            '취소',
                                                            style: TextStyle(
                                                              color: Colors.white,
                                                              fontSize: 16,
                                                              fontWeight: FontWeight.bold,
                                                            ),
                                                          ),
                                                        )
                                                    ),

                                                    SizedBox(width: 10),

                                                    InkWell(
                                                        onTap: () {
                                                          _closeAllDialogs();

                                                          Fluttertoast.showToast(
                                                            msg: '일정이 삭제되었습니다.',
                                                            toastLength: Toast.LENGTH_SHORT,
                                                            backgroundColor: Colors.grey,
                                                            textColor: Colors.white,
                                                            fontSize: 16.0,
                                                          );
                                                          // 클릭 이벤트에 따른 로직 작성
                                                        },
                                                        child: Container(
                                                          decoration: BoxDecoration(
                                                            color: Color(0xFF176FF2), // 배경색
                                                            borderRadius: BorderRadius.circular(30),
                                                            boxShadow: [
                                                              BoxShadow(
                                                                color: Colors.black.withOpacity(0.2), // 그림자 색상
                                                                spreadRadius: 1, // 그림자 확산 범위
                                                                blurRadius: 2, // 그림자 흐림 정도
                                                                offset: Offset(0, 3), // 그림자 위치 (x, y)
                                                              ),
                                                            ],
                                                          ),
                                                          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                                                          child: Text(
                                                            '확인',
                                                            style: TextStyle(
                                                              color: Colors.white,
                                                              fontSize: 16,
                                                              fontWeight: FontWeight.bold,
                                                            ),
                                                          ),
                                                        )
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  child: Align(
                                    alignment: Alignment.topRight,
                                    child: Icon(
                                      Icons.delete_rounded,
                                      color: Color(0xFFC7C7CC),
                                      size: 25,
                                    ),
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
                                  showCursor: true,

                                  decoration: InputDecoration(
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
                                      value: selectedAlarm,
                                      onChanged: (String? newValue) {
                                        bottomState(() {
                                          setState(() {
                                            selectedAlarm = newValue!;
                                            print("alarm option : " + aToggledList.toString());

                                            // 선택된 값에 따라 aToggledList 업데이트
                                            for (int i = 0; i < alarm.length; i++) {
                                              aToggledList[i] = alarm[i] == selectedAlarm;
                                            }
                                          });
                                        });
                                      },
                                      underline: SizedBox(), // 밑줄 제거
                                      icon: Padding(
                                        padding: EdgeInsets.only(left: 25), // 아이콘 왼쪽 패딩 설정
                                        child: Icon(Icons.arrow_drop_down),
                                      ), // 드롭다운 아이콘
                                      items: alarm.map<DropdownMenuItem<String>>((String value) {
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
                                            selectedColor = colors[index];
                                            print("color option : " + selectedColor.toString());
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
    return Row(
      children: [
        InkWell(
          onTap: () {
            _showScheduleDialog();
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

// 중첩된 다이얼로그를 모두 닫기
  void _closeAllDialogs() {
    if (_nestedDialogContext != null) {
      Navigator.pop(_nestedDialogContext!); // 중첩 다이얼로그 닫기
      _nestedDialogContext = null;
    }

    if (_mainDialogContext != null) {
      Navigator.pop(_mainDialogContext!); // 메인 다이얼로그 닫기
      _mainDialogContext = null;
    }
  }

  String _getDayOfWeek(DateTime date) {
    final List<String> daysOfWeek = ['일', '월', '화', '수', '목', '금', '토'];

    if (date.weekday == 7 ) return daysOfWeek[0]; // 일요일의 경우 0 인덱스를 사용
    else return daysOfWeek[date.weekday];
  }
}