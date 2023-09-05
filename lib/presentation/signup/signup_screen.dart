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

  final FocusNode nameFocus = FocusNode();
  final FocusNode emailFocus = FocusNode();
  final FocusNode pwFocus = FocusNode();
  final FocusNode pwcheckFocus = FocusNode();

  final _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();

    nameField.text = "yuda";
    emailField.text = "dyj09087@gmail.com";
    pwField.text = "r3OeR0UDal";
    pwcheckField.text = "r3OeR0UDal";
  }

  //firebase sign-up
  void signUpWithFirebase(
      String name, String email, String pw, String pwcheck) async {
    print('로그인 성공');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(children: [
          Form(
            key: _formKey,
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 40,
                            right: 40,
                            top: 50,
                            bottom: 30,
                          ),
                          child: Column(
                            children: [
                              const Text(
                                '회원가입',
                                style: TextStyle(
                                    fontSize: 50, fontWeight: FontWeight.w500),
                              ),
                              const SizedBox(
                                height: 50,
                              ),
                              CustomTextformfield(
                                name: '이름',
                                isPassword: false,
                                controller: nameField,
                                focusNode: nameFocus,
                                validator: (value) => CheckValidate()
                                    .validateName(nameFocus, '$value'),
                              ),
                              const SizedBox(
                                height: 25,
                              ),
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
                              const SizedBox(
                                height: 25,
                              ),
                              CustomTextformfield(
                                name: '비밀번호 확인',
                                isPassword: true,
                                controller: pwcheckField,
                                focusNode: pwcheckFocus,
                                validator: (value) => CheckValidate()
                                    .validatePwCheck(
                                        pwcheckFocus, '$value', pwField.text),
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              const SignupTermsOfService(), //약관동의
                              const SizedBox(
                                height: 25,
                              ),
                              CustomButtonMainColor(
                                onPressed: () async {
                                  if (_formKey.currentState!.validate()) {
                                    // validation 이 성공하면 폼 저장하기
                                    _formKey.currentState!.save();
                                    print('성공');
                                    // If the form is valid, display a SnackBar. In the real world,
                                    // you'd often call a server or save the information in a database.
                                    signUpWithFirebase(
                                        nameField.text,
                                        emailField.text,
                                        pwField.text,
                                        pwcheckField.text);
                                  }
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
          ),
          const CustomHeader(),
        ]),
      ),
    );
  }
}

class CheckValidate {
  //이름 유효성 검사
  String? validateName(FocusNode focusNode, String value) {
    if (value.isEmpty) {
      focusNode.requestFocus();
      return '이름을 입력하세요.';
    } else {
      return null;
    }
  }

  String? validateEmail(FocusNode focusNode, String value) {
    if (value.isEmpty) {
      focusNode.requestFocus();
      return '이메일을 입력하세요.';
    } else {
      Pattern pattern =
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
      RegExp regExp = new RegExp('$pattern');
      if (!regExp.hasMatch(value)) {
        focusNode.requestFocus(); //포커스를 해당 textformfield에 맞춘다.
        return '잘못된 이메일 형식입니다.';
      } else {
        return null;
      }
    }
  }

  String? validatePassword(FocusNode focusNode, String value) {
    if (value.isEmpty) {
      focusNode.requestFocus();
      return '비밀번호를 입력하세요.';
    } else {
      Pattern pattern =
          r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?~^<>,.&+=])[A-Za-z\d$@$!%*#?~^<>,.&+=]{8,15}$';
      RegExp regExp = new RegExp('$pattern');
      if (!regExp.hasMatch(value)) {
        focusNode.requestFocus();
        return '특수문자, 대소문자, 숫자 포함 8자 이상 15자 이내로 입력하세요.';
      } else {
        return null;
      }
    }
  }

  String? validatePwCheck(FocusNode focusNode, String value, String pw) {
    if (value.isEmpty) {
      focusNode.requestFocus();
      return '비밀번호를 한 번 더 입력하세요.';
    } else if (value != pw) {
      focusNode.requestFocus();
      return '비밀번호가 일치하지 않습니다.';
    } else {
      return null;
    }
  }
}
