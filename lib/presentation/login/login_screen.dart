import 'dart:ui';

import 'package:artroad/presentation/basepage_screen/basepage_screen.dart';
import 'package:artroad/presentation/signup/signup_screen.dart';
import 'package:artroad/widgets/check_validate.dart';
import 'package:artroad/widgets/custom_button_main_color.dart';
import 'package:flutter/material.dart';
import 'package:artroad/theme/theme_helper.dart';
import 'dart:async';
import 'package:artroad/widgets/custom_textformfield.dart';
import 'package:artroad/presentation/login/login_forgot_password.dart';

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
  final TextEditingController emailField = TextEditingController();
  final TextEditingController pwField = TextEditingController();
  int currentImageIndex = 0;
  late Timer timer;
  bool _isCheckRemember = false; //아이디 저장 checkbox

  final FocusNode emailFocus = FocusNode();
  final FocusNode pwFocus = FocusNode();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 5), _changeBackground);
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  void _changeBackground(Timer timer) {
    setState(() {
      currentImageIndex = (currentImageIndex + 1) % backgroundImageUrls.length;
    });
  }

  void _showLoginDialog() {
    //로그인 창
    showModalBottomSheet<void>(
      backgroundColor: Colors.white,
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
                          Form(
                            key: _formKey,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  '로그인',
                                  textAlign: TextAlign.end,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 35,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(height: 46),
                                CustomTextformfield(
                                  name: '이메일',
                                  isPassword: false,
                                  controller: emailField,
                                  focusNode: emailFocus,
                                  validator: (value) => CheckValidate()
                                      .validateEmail(emailFocus, '$value'),
                                ),
                                SizedBox(
                                  height: 25,
                                ),
                                CustomTextformfield(
                                  name: '비밀번호',
                                  isPassword: true,
                                  controller: pwField,
                                  focusNode: pwFocus,
                                  validator: (value) => CheckValidate()
                                      .validatePassword(pwFocus, '$value'),
                                ),
                                const SizedBox(height: 17),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Checkbox(
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
                                    TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                LoginForgotPasswordScreen(),
                                          ),
                                        );
                                      },
                                      style: TextButton.styleFrom(
                                        textStyle: TextStyle(
                                          decoration: TextDecoration.underline,
                                          color: Colors.blue,
                                        ),
                                      ),
                                      child: Text('비밀번호를 잃어버리셨나요?'),
                                    )
                                  ],
                                ),
                                const SizedBox(height: 25),
                                CustomButtonMainColor(
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      // validation 이 성공하면 폼 저장하기
                                      _formKey.currentState!.save();
                                      print('로그인 성공');
                                      Navigator.pop(context); // 다이얼로그 닫기
                                      //로그인 로직 추가
                                      // 로그인 성공 후 페이지 이동
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              BasepageScreen(),
                                        ),
                                      );
                                    }
                                  },
                                  text: '로그인',
                                ),
                                const SizedBox(height: 25),
                                const SizedBox(
                                  height: 25,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('기존 회원이 아니신가요?'),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                SignupScreen(),
                                          ),
                                        );
                                      },
                                      style: TextButton.styleFrom(
                                        textStyle: TextStyle(
                                          decoration: TextDecoration.underline,
                                          color: Colors.blue,
                                        ),
                                      ),
                                      child: Text('회원가입'),
                                    )
                                  ],
                                )
                              ],
                            ),
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
    return SafeArea(
      child: Scaffold(
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
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "ArtRoad",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: theme.textTheme.displaySmall?.copyWith(
                            fontSize: 80, // 폰트 사이즈 조절
                            fontWeight: FontWeight.normal, // 폰트 굵기 조절
                            color: Colors
                                .white // 텍스트 색상 설정 (그라데이션에 의해 가려지므로 원하는 색상 사용 가능)
                            ),
                      ),
                    ),
                  ),
                  const Flexible(
                      flex: 1,
                      child: SizedBox(
                        height: 200,
                      )),
                  Flexible(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                        child: TextButton(
                          onPressed: _showLoginDialog,
                          style: TextButton.styleFrom(
                            backgroundColor: Color(0x5F5E5E5E),
                            maximumSize: Size(300, 64),
                            minimumSize: Size(250, 58),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          child: Text(
                            '시작하기',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
