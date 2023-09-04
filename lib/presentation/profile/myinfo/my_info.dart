import 'package:artroad/core/app_export.dart';
import 'package:artroad/widgets/custom_header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MyInfo extends StatefulWidget {
  @override
  State<MyInfo> createState() => _MyInfo();
}

class _MyInfo extends State<MyInfo> {
  bool _socialLogin = false; // 소셜 로그인 정보
  bool condition1 = false; // 약관 동의
  bool condition2 = false; // 이메일 일치

  TextEditingController _controller = TextEditingController();
  String _storedValue = '';

  @override
  void dispose() {
    _controller.dispose(); // 컨트롤러를 폐기해야 합니다.
    super.dispose();
  }

  // void _saveValue() {
  //   setState(() {
  //     _storedValue = _controller.text;
  //   });
  // }


  // 탈퇴하기 Dialog
  void _showResignDialog() {
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
        print(MediaQuery.of(context).viewInsets.bottom);
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter bottomState) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 20, left: 35, right: 35, bottom: 20),
                child: Container(
                  // 키보드 창 크기만큼 컨텐츠 올리기
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Stack(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              // --- 구현부 ---
                              Text(
                                '탈퇴하기',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),

                              SizedBox(height: 15),

                              Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '회원 탈퇴 전, 유의사항을 확인해 주시기 바랍니다.',
                                        style: TextStyle(
                                          fontSize: 13,
                                        ),
                                      ),

                                      Text(
                                        '유의사항 확인',
                                        style: TextStyle(
                                          decoration: TextDecoration.underline,
                                          fontSize: 11,
                                          color: Color(0xFF939191),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 5),
                                  Align(
                                    alignment: Alignment.center,
                                    child: Row(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            bottomState((){
                                              setState(() {
                                                condition1 = !condition1;
                                              });
                                            });
                                          },
                                          child: Icon(
                                            condition1 ? Icons.check_box_rounded : Icons.square_outlined,
                                            size: 16,
                                            color: Color(0xFF176FF2),
                                          ),
                                        ),
                                        SizedBox(width: 3),
                                        Text(
                                          'ArtRoad 회원 탈퇴 시 처리사항 안내를 확인하였음에 동의합니다.',
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Color(0xFF176FF2),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),

                              SizedBox(height: 15),

                              Divider(),

                              SizedBox(height: 15),

                              TextFormField(
                                controller: _controller,
                                cursorColor: Colors.black,
                                cursorWidth: 1.5,
                                showCursor: true,

                                decoration: InputDecoration(
                                  hintText: ' 가입되어 있는 이메일을 입력해 주세요.',
                                  hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14,
                                  ),
                                  border: InputBorder.none,

                                  filled: true, // 배경을 채울지 여부 설정
                                  fillColor: Color(0xFFF4F4F4), // 배경색 설정
                                  enabledBorder: OutlineInputBorder( // 활성 상태가 아닐 때의 경계선 스타일
                                    borderSide: BorderSide(
                                      color: Colors.transparent, // 경계선 색상
                                      width: 0, // 경계선 너비
                                    ),
                                    borderRadius: BorderRadius.circular(50), // 경계선 모서리 둥글기 설정
                                  ),
                                  focusedBorder: OutlineInputBorder( // 활성 상태일 때의 경계선 스타일
                                    borderSide: BorderSide(
                                      color: Colors.transparent, // 경계선 색상
                                      width: 0, // 경계선 너비
                                    ),
                                    borderRadius: BorderRadius.circular(50), // 경계선 모서리 둥글기 설정
                                  ),
                                ),
                              ),

                              SizedBox(height: 10),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                      onTap: () {
                                        // 클릭 이벤트에 따른 로직 작성
                                        Navigator.pop(context);
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
                                        // 클릭 이벤트에 따른 로직 작성
                                        bottomState((){
                                          setState(() {
                                            _storedValue = _controller.text;
                                            if(condition1 == false) {
                                              Fluttertoast.showToast(
                                                msg: '처리사항 안내 확인에 동의해 주세요.',
                                                toastLength: Toast.LENGTH_SHORT,
                                                backgroundColor: Colors.grey,
                                                textColor: Colors.white,
                                                fontSize: 16.0,
                                              );
                                            }
                                            else if(_storedValue == '사용자 이메일') {
                                              condition2 = true;
                                              if(condition1 && condition2) {
                                                //--- 탈퇴 처리 구현부 ---
                                                Fluttertoast.showToast(
                                                  msg: '탈퇴 되었습니다.',
                                                  toastLength: Toast.LENGTH_SHORT,
                                                  backgroundColor: Colors.grey,
                                                  textColor: Colors.white,
                                                  fontSize: 16.0,
                                                );
                                              }
                                            }
                                            else {
                                              Fluttertoast.showToast(
                                                msg: '이메일이 일치하지 않습니다.',
                                                toastLength: Toast.LENGTH_SHORT,
                                                backgroundColor: Colors.grey,
                                                textColor: Colors.white,
                                                fontSize: 16.0,
                                              );
                                            }
                                          });
                                        });
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
                          )
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
        CustomHeader(
          name: '내 정보',
        ),
        Expanded(
          child: Container(
            color: Color(0xFFF4F4F4),
            child: Column(
              children: [
                Container(
                  color: Colors.white,
                  height: 286,
                  child: Padding(
                    padding: getPadding(left: 20, right: 20),
                    child: Column(
                      children: [
                        Container(
                          height: 41,
                          child: Row(
                            children: [
                              Text(
                                "이름",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(),
                        Container(
                          height: 41,
                          child: Row(
                            children: [
                              Text(
                                "이메일",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(),
                        Container(
                          height: 41,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "소셜로그인 연동",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              CupertinoSwitch(
                                value: _socialLogin,
                                activeColor: Colors.green,
                                onChanged: (bool? value) {
                                  setState(() {
                                    //--- 소셜 로그인 연동 부분 ---
                                    _socialLogin = value ?? false;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                        Divider(),
                        Container(
                          height: 41,
                          child: InkWell(
                            onTap: () {
                              //--- 알림 권한 요청 구현부 ---
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "알림 권한 설정",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Icon(
                                  Icons.keyboard_arrow_right_rounded,
                                  color: Color(0xFF939191),
                                  size: 30,
                                ),
                              ],
                            ),
                          ),
                        ),
                        Divider(),
                        Container(
                          height: 41,
                          child: InkWell(
                            onTap: () {
                              //--- 위치 권한 요청 구현부 ---
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "위치 권한 설정",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Icon(
                                  Icons.keyboard_arrow_right_rounded,
                                  color: Color(0xFF939191),
                                  size: 30,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 15),
                InkWell(
                  onTap: () {
                    // --- 회원 탈퇴 기능 구현부 ---
                    _showResignDialog();
                  },
                  child: Text(
                    '회원 탈퇴하기',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF939191),
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

}