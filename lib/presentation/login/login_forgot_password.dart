import 'package:artroad/presentation/login/login_screen.dart';
import 'package:artroad/widgets/check_validate.dart';
import 'package:artroad/widgets/custom_header.dart';
import 'package:artroad/widgets/custom_textformfield.dart';
import 'package:artroad/widgets/custom_button_main_color.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginForgotPasswordScreen extends StatefulWidget {
  const LoginForgotPasswordScreen({super.key});

  @override
  State<LoginForgotPasswordScreen> createState() =>
      _LoginForgotPasswordScreenState();
}

class _LoginForgotPasswordScreenState extends State<LoginForgotPasswordScreen> {
  final TextEditingController emailField = TextEditingController();
  final FocusNode emailFocus = FocusNode();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CustomHeader(
                name: '비밀번호 찾기',
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                '가입한 이메일 주소를 입력해주세요.\n비밀번호 재설정 메일을 보내드립니다.',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: EdgeInsets.only(left: 40, right: 40, bottom: 30),
                child: Column(
                  children: [
                    CustomTextformfield(
                      name: '이메일',
                      isPassword: false,
                      controller: emailField,
                      focusNode: emailFocus,
                      validator: (value) =>
                          CheckValidate().validateEmail(emailFocus, '$value'),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    CustomButtonMainColor(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // validation 이 성공하면 폼 저장하기
                          _formKey.currentState!.save();

                          Navigator.pop(context); // 다이얼로그 닫기
                          //회원가입 로직
                          print('메일 발신 성공');
                          Fluttertoast.showToast(
                            msg: '메일을 보냈습니다.',
                            toastLength: Toast.LENGTH_SHORT,
                            backgroundColor: Colors.grey,
                            textColor: Colors.white,
                            fontSize: 16.0,
                          );
                        }
                      },
                      text: '비밀번호 재설정하기',
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
