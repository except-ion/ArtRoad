import 'package:artroad/presentation/basepage_screen/basepage_screen.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  List<String> backgroundImageUrls = [
    'assets/images/login_background_image_1.png',
    'assets/images/login_background_image_2.png',
    'assets/images/login_background_image_3.png',
    'assets/images/login_background_image_4.png',
    'assets/images/login_background_image_5.png',
    'assets/images/login_background_image_6.png',
    'assets/images/login_background_image_7.png',
    'assets/images/login_background_image_8.png',
    'assets/images/login_background_image_9.png',
    'assets/images/login_background_image_10.png',
    'assets/images/login_background_image_11.png',
  ];
  int currentImageIndex = 0;
  late Timer timer;
  bool _isCheckRemember = false; //아이디 저장 checkbox

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 5), _changeBackground);
  }

  void _changeBackground(Timer timer) {
    setState(() {
      currentImageIndex = (currentImageIndex + 1) % backgroundImageUrls.length;
    });
  }

  void _showLoginDialog() {
    //로그인 창
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
                    top: 50, left: 40, right: 40, bottom: 30),
                child: Container(
                  //키보드 창 크기만큼 컨텐츠 올리기
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
                              const Text(
                                '로그인',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 30,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(height: 26),
                              TextFormField(
                                decoration:
                                    const InputDecoration(labelText: '이메일'),
                              ),
                              TextFormField(
                                decoration:
                                    const InputDecoration(labelText: '비밀번호'),
                                obscureText: true,
                              ),
                              const SizedBox(height: 25),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Checkbox(
                                        fillColor: MaterialStateProperty.all(
                                            const Color(0xFF00233D)),
                                        activeColor: Color(0xFF00233D),
                                        value: _isCheckRemember,
                                        onChanged: (value) {
                                          bottomState(() {
                                            setState(() {
                                              print('\n\n\n$value');
                                              _isCheckRemember = value!;
                                            });
                                          });
                                        },
                                        materialTapTargetSize: //패딩 제거
                                            MaterialTapTargetSize.shrinkWrap,
                                      ),
                                      const Text('아이디 저장'),
                                    ],
                                  ),
                                  const Text(
                                    '비밀번호를 잃어버리셨나요?',
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 25),
                              SizedBox(
                                height: 50,
                                width: 300,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context); // 다이얼로그 닫기
                                    //로그인 로직 추가
                                    // 로그인 성공 후 페이지 이동
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => BasepageScreen(),
                                      ),
                                    );

                                    print('로그인 성공');
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF00233D),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                  ),
                                  child: const Text(
                                    '로그인',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 25),
                              // const Row(
                              //   mainAxisAlignment: MainAxisAlignment.center,
                              //   children: [
                              //     Divider(
                              //         color: Colors.black, thickness: 1.0),
                              //     Text(
                              //       'SNS 로그인',
                              //       textAlign: TextAlign.center,
                              //       style: TextStyle(
                              //           textBaseline: TextBaseline.alphabetic),
                              //     ),
                              //     Divider(
                              //         color: Colors.black, thickness: 1.0),
                              //   ],
                              // ),
                              // const SizedBox(
                              //   height: 20,
                              // ),
                              SizedBox(
                                height: 50,
                                width: 300,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context); // 다이얼로그 닫기
                                    //로그인 로직 추가
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => BasepageScreen(),
                                      ), // 홈화면으로 이동
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xFFFEE500),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      minimumSize: const Size(300, 50)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Transform.scale(
                                          scale: 0.7,
                                          child: Image.asset(
                                              'assets/images/login_kakao.png')),
                                      const Padding(
                                        padding: EdgeInsets.only(left: 45),
                                        child: Text(
                                          '카카오 로그인',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18,
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('기존 회원이 아니신가요?'),
                                  Text(
                                    '회원가입',
                                    style: TextStyle(
                                      color: Colors.blue,
                                    ),
                                  ),
                                ],
                              )
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
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: GestureDetector(
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              backgroundImageUrls[currentImageIndex],
              fit: BoxFit.cover,
            ),
            Column(
              children: [
                Flexible(
                  flex: 3,
                  child: Center(
                    child: Text(
                      'ArtRoad',
                      style: TextStyle(color: Colors.white, fontSize: 70),
                    ),
                  ),
                ),
                const Flexible(
                    flex: 1,
                    child: SizedBox(
                      height: 200,
                    )),
                Flexible(
                  child: ElevatedButton(
                    onPressed: _showLoginDialog,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0x7F5D5D5D),
                      foregroundColor: Colors.white,
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'Nunito',
                        fontWeight: FontWeight.w700,
                        height: 1.20,
                      ),
                      maximumSize: Size(250, 58),
                      minimumSize: Size(250, 58),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: Text('시작하기'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
