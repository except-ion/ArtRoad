import 'package:artroad/presentation/login/login_screen.dart';
import 'package:artroad/presentation/signup/signup_terms_of_service.dart';
import 'package:artroad/widgets/custom_header.dart';
import 'package:artroad/widgets/custom_textformfield.dart';
import 'package:artroad/widgets/custom_button_main_color.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
    if (pw != pwcheck) {
      Fluttertoast.showToast(
        msg: '비밀번호가 일치하지 않습니다.',
        toastLength: Toast.LENGTH_SHORT,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
    final credential = await _firebaseAuthService.registerWithEmailPassword(name, email, pw, pwcheck);
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
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            CustomTextformfield(
                              name: '이메일',
                              isPassword: false,
                              controller: emailField,
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            CustomTextformfield(
                              name: '비밀번호',
                              isPassword: true,
                              controller: pwField,
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            CustomTextformfield(
                              name: '비밀번호 확인',
                              isPassword: true,
                              controller: pwcheckField,
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
                                signUpWithFirebase(nameField.text, emailField.text, pwField.text, pwcheckField.text);
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
          const CustomHeader(),
        ]),
      ),
    );
  }
}
