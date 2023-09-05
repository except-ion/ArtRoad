import 'package:artroad/presentation/login/login_screen.dart';
import 'package:artroad/presentation/signup/signup_terms_of_service.dart';
import 'package:artroad/widgets/custom_header.dart';
import 'package:artroad/widgets/custom_textformfield.dart';
import 'package:artroad/widgets/custom_button_main_color.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../widgets/check_validate.dart';
import 'package:artroad/presentation/services/firebase_auth_services.dart';

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
  final FirebaseAuthService _firebaseAuthService = FirebaseAuthService();

  //firebase signup
  final _auth = FirebaseAuth.instance;

  //firebase sign-up
  void signUpWithFirebase(
      String name, String email, String pw, String pwcheck) async {
    final credential = await _firebaseAuthService.registerWithEmailPassword(
        name, email, pw, pwcheck);
    if (credential != null) {
      await FirebaseFirestore.instance
          .collection('user')
          .doc(credential.uid)
          .set({
        'userName': name,
        'email': email,
      });
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('회원가입 성공')));
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        ),
      );
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('회원가입 실패')));
    }
  }

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
