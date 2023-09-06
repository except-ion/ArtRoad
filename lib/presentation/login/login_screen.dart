import 'dart:ui';

import 'package:artroad/presentation/basepage_screen/basepage_screen.dart';
import 'package:artroad/src/provider/user_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:artroad/presentation/signup/signup_screen.dart';
import 'package:artroad/widgets/check_validate.dart';
import 'package:artroad/widgets/custom_button_main_color.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:artroad/theme/theme_helper.dart';
import 'dart:async';
import 'package:artroad/src/model/login_platform.dart';
import 'package:artroad/widgets/custom_textformfield.dart';
import 'package:artroad/presentation/login/login_forgot_password.dart';
import 'package:artroad/presentation/services/firebase_auth_services.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginPlatform _loginPlatform = LoginPlatform.none;
  TextEditingController emailField = TextEditingController();
  TextEditingController pwField = TextEditingController();
  final FirebaseAuthService _firebaseAuthService = FirebaseAuthService();

  //firebase login
  void signInWithFirebase(String email, String pw) async {
    final user = await _firebaseAuthService.signInWithFirebase(email, pw);
    if (user != null) {
      final userProvider = Provider.of<UserProvider>(context, listen: false);
      userProvider.setFirebaseUserId(user.uid);
      // 로그인 성공 후 처리
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('로그인 성공')));

      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => BasepageScreen(),
        ),
      );
    } else {
      // 로그인 실패 처리
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('로그인 실패')));
    }
  }

  //Kakao login
  // Future<bool> signInWithKakao() async {
  //   try {
  //     bool isInstalled = await isKakaoTalkInstalled();

  //     OAuthToken token = isInstalled
  //         ? await UserApi.instance.loginWithKakaoTalk()
  //         : await UserApi.instance.loginWithKakaoAccount();
  //     print('token: $token');
  //     // bool isSavedFirebase = await saveUserData(token.accessToken);
  //     // if(isSavedFirebase) {
  //     //   print('isSaveFirebase 성공');
  //     // } else {
  //     //   print('isSaveFirebase 실패');
  //     // }
  //     return true;
  //   } catch (error) {
  //     print('카카오톡으로 로그인 실패 $error');
  //     return false;
  //   }
  // }

  //카카오 로그인 정보 firebase에 유저 정보 저장
  // Future<bool> saveUserData(String token) async {
  //   try{
  //     final userCredential = await _auth.signInAnonymously();
  //     print('userCredential : $userCredential');

  //     if(userCredential.user != null) {
  //       final uid = userCredential.user?.uid;
  //       print('uid : $uid');
  //       await _firestore.collection('Users').doc(uid).set({
  //         'providerId': 'kakao.com',
  //         'userName': (await UserApi.instance.me()).kakaoAccount!.profile!.nickname,
  //         'idToken': token
  //       });
  //       print('collection 저장');
  //     }
  //     return true;
  //   } catch (e) {
  //     print('saveUserData error: $e');
  //     return false;
  //   }
  // }

  // void signOut() async {
  //   switch (_loginPlatform) {
  //     case LoginPlatform.firebase:
  //       break;
  //     case LoginPlatform.none:
  //       break;
  //   }

  //   setState(() {
  //     _loginPlatform = LoginPlatform.none;
  //   });
  // }

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

  final FocusNode emailFocus = FocusNode();
  final FocusNode pwFocus = FocusNode();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 5), _changeBackground);
    emailField.text = "judyzero11@gmail.com";
    pwField.text = "Qwerqwer1!";
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
                                    fontWeight: FontWeight.bold,
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
                                const SizedBox(
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
                                          activeColor: const Color(0xFF00233D),
                                          value: _isCheckRemember,
                                          onChanged: (value) {
                                            bottomState(() {
                                              setState(() {
                                                _isCheckRemember = value!;
                                              });
                                            });
                                          },
                                          materialTapTargetSize: //패딩 제거
                                              MaterialTapTargetSize.shrinkWrap,
                                        ),
                                        const FittedBox(
                                          child: AutoSizeText('아이디 저장',
                                              maxFontSize: 16),
                                        ),
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
                                      child: const FittedBox(
                                        child: AutoSizeText(
                                          '비밀번호를 잃어버리셨나요?',
                                          maxFontSize: 16,
                                          style: TextStyle(
                                            decoration:
                                                TextDecoration.underline,
                                            color: Colors.blue,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(height: 25),
                                CustomButtonMainColor(
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      // validation 이 성공하면 폼 저장하기
                                      signInWithFirebase(
                                          emailField.text, pwField.text);
                                      _formKey.currentState!.save();
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
                                            builder: (context) =>
                                                const SignupScreen(),
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
                      child: AutoSizeText(
                        "ArtRoad",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: theme.textTheme.displaySmall?.copyWith(
                            fontSize: 80, // 폰트 사이즈 조절
                            fontWeight: FontWeight.normal, // 폰트 굵기 조절
                            color: Colors
                                .white // 텍스트 색상 설정 (그라데이션에 의해 가려지므로 원하는 색상 사용 가능)
                            ),
                        maxFontSize: 80,
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
      ),
    );
  }
}
