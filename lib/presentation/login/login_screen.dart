import 'dart:ui';
import 'dart:convert';
import 'dart:io';
import 'package:artroad/presentation/basepage_screen/basepage_screen.dart';
import 'package:flutter/material.dart';
import 'package:artroad/theme/theme_helper.dart';
import 'dart:async';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk_user.dart';
import 'package:http/http.dart' as http;
import 'package:artroad/src/model/login_platform.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:artroad/widgets/custom_textformfield.dart';
import 'package:artroad/presentation/signup/signup_screen.dart';
import 'package:artroad/widgets/custom_button_main_color.dart';
import 'package:artroad/presentation/login/login_forgot_password.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginPlatform _loginPlatform = LoginPlatform.none;
  TextEditingController emailField = TextEditingController();
  TextEditingController pwField = TextEditingController();
  final _auth = FirebaseAuth.instance;

  //firebase login
  void signInWithFirebase(String email, String pw) async {
    try {
      final credential = await _auth.signInWithEmailAndPassword(
        email: email, 
        password: pw
        );
      if (credential.user != null) {
        setState(() {
          _loginPlatform = LoginPlatform.firebase;
        });
        // 로그인 성공 후 페이지 이동
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => BasepageScreen(),
          ),
        );       
      }
    } on FirebaseException catch (e) {
      ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(e.message!)));
    } catch (e) {
      print(e);
    }
  }

  //Kakao login
  void signInWithKakao() async {
    try {
      bool isInstalled = await isKakaoTalkInstalled();

      OAuthToken token = isInstalled
          ? await UserApi.instance.loginWithKakaoTalk()
          : await UserApi.instance.loginWithKakaoAccount();
      print('token: $token');

      final url = Uri.https('kapi.kakao.com', '/v2/user/me');

      final response = await http.get(
        url,
        headers: {
          HttpHeaders.authorizationHeader: 'Bearer ${token.accessToken}'
        },
      );

      final profileInfo = json.decode(response.body);
      print(profileInfo.toString());

      setState(() {
        _loginPlatform = LoginPlatform.kakao;
      });

    } catch (error) {
      print('카카오톡으로 로그인 실패 $error');
    }
  }

  void signOut() async {
    switch (_loginPlatform) {
      case LoginPlatform.firebase:
        break;
      case LoginPlatform.kakao:
        await UserApi.instance.logout();
        break;
      case LoginPlatform.none:
        break;
    }

    setState(() {
      _loginPlatform = LoginPlatform.none;
    });
  }

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
    showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Error'),
        content: const Text('Please enter an email.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Close the dialog
            },
            child: const Text('OK'),
          ),
        ],
      );
    },
  );
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
                          Column(
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
                                  controller: emailField),
                              const SizedBox(
                                height: 25,
                              ),
                              CustomTextformfield(
                                  name: '비밀번호',
                                  isPassword: true,
                                  controller: pwField),
                              const SizedBox(height: 17),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Checkbox(
                                        activeColor: const Color(0xFF00233D),
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
                                              const LoginForgotPasswordScreen(),
                                        ),
                                      );
                                    },
                                    style: TextButton.styleFrom(
                                      textStyle: const TextStyle(
                                        decoration: TextDecoration.underline,
                                        color: Colors.blue,
                                      ),
                                    ),
                                    child: const Text('비밀번호를 잃어버리셨나요?'),
                                  )
                                ],
                              ),
                              const SizedBox(height: 25),
                              CustomButtonMainColor(
                                onPressed: () {
                                  Navigator.pop(context); // 다이얼로그 닫기
                                  //로그인 로직 추가
                                  signInWithFirebase(emailField.text, pwField.text);
                                },
                                text: '로그인',
                              ),
                              const SizedBox(height: 25),
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context); // 다이얼로그 닫기
                                  signInWithKakao();
                                  // _kakaoLoginPressed();
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => BasepageScreen(),
                                    ), // 홈화면으로 이동
                                  );
                                },
                                style: TextButton.styleFrom(
                                    textStyle: const TextStyle(
                                        textBaseline: TextBaseline.alphabetic),
                                    backgroundColor: const Color(0xFFFEE500),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    minimumSize: const Size(350, 50)),
                                child: Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    Positioned(
                                      top: -6,
                                      left: -100,
                                      child: Transform.scale(
                                          scale: 0.6,
                                          child: Image.asset(
                                              'assets/images/login_kakao.png')),
                                    ),
                                    const Text(
                                      '카카오 로그인',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text('기존 회원이 아니신가요?'),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => const SignupScreen(),
                                        ),
                                      );
                                    },
                                    style: TextButton.styleFrom(
                                      textStyle: const TextStyle(
                                        decoration: TextDecoration.underline,
                                        color: Colors.blue,
                                      ),
                                    ),
                                    child: const Text('회원가입'),
                                  )
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
                          backgroundColor: const Color(0x5F5E5E5E),
                          maximumSize: const Size(300, 64),
                          minimumSize: const Size(250, 58),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: const Text(
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
    );
  }
}
