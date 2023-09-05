import 'package:artroad/presentation/signup/signup_terms_of_service.dart';
import 'package:artroad/widgets/custom_header.dart';
import 'package:artroad/widgets/custom_textformfield.dart';
import 'package:artroad/widgets/custom_button_main_color.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController nameField = TextEditingController();
  final TextEditingController emailField = TextEditingController();
  final TextEditingController pwField = TextEditingController();
  final TextEditingController pwcheckField = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(children: [
          Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          left: 40,
                          right: 40,
                          top: 50,
                          bottom: 30,
                        ),
                        child: Column(
                          children: [
                            Text(
                              '회원가입',
                              style: TextStyle(
                                  fontSize: 50, fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            CustomTextformfield(
                              name: '이름',
                              isPassword: false,
                              controller: nameField,
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            CustomTextformfield(
                              name: '이메일',
                              isPassword: false,
                              controller: emailField,
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            CustomTextformfield(
                              name: '비밀번호',
                              isPassword: false,
                              controller: pwField,
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            CustomTextformfield(
                              name: '비밀번호 확인',
                              isPassword: false,
                              controller: pwcheckField,
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            SignupTermsOfService(), //약관동의
                            SizedBox(
                              height: 25,
                            ),
                            CustomButtonMainColor(
                              onPressed: () {
                                Navigator.pop(context); // 다이얼로그 닫기
                                //회원가입 로직
                                print('회원가입 성공');
                                Fluttertoast.showToast(
                                  msg: '가입되었습니다.',
                                  toastLength: Toast.LENGTH_SHORT,
                                  backgroundColor: Colors.grey,
                                  textColor: Colors.white,
                                  fontSize: 16.0,
                                );
                              },
                              text: '회원가입',
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          CustomHeader(),
        ]),
      ),
    );
  }
}
