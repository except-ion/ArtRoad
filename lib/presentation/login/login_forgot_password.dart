import 'package:artroad/widgets/custom_header.dart';
import 'package:artroad/widgets/custom_textformfield.dart';
import 'package:artroad/widgets/custom_button_main_color.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginForgotPasswordScreen extends StatefulWidget {
  const LoginForgotPasswordScreen({super.key});

  @override
  State<LoginForgotPasswordScreen> createState() =>
      _LoginForgotPasswordScreenState();
}

class _LoginForgotPasswordScreenState extends State<LoginForgotPasswordScreen> {
  final TextEditingController emailField = TextEditingController();
  final _auth = FirebaseAuth.instance;

  Future<bool> resetPassword({required String email}) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      return true;
    } on FirebaseAuthException catch (e) {
      if (e.code.toString() == 'invalid-email') {
        Fluttertoast.showToast(
          msg: '이메일 형식이 올바르지 않습니다.',
          toastLength: Toast.LENGTH_SHORT,
          backgroundColor: Colors.grey,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      }
      if (e.code.toString() == 'user-not-found') {
        Fluttertoast.showToast(
          msg: '등록되지 않은 사용자입니다.',
          toastLength: Toast.LENGTH_SHORT,
          backgroundColor: Colors.grey,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const CustomHeader(
              name: '비밀번호 찾기',
            ),
            const SizedBox(
              height: 50,
            ),
            const Text(
              '가입한 이메일 주소를 입력해주세요.\n비밀번호 재설정 메일을 보내드립니다.',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40, right: 40, bottom: 30),
              child: Column(
                children: [
                  CustomTextformfield(
                    name: '이메일',
                    isPassword: false,
                    controller: emailField,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  CustomButtonMainColor(
                    onPressed: () async {
                      bool isSuccess =
                          await resetPassword(email: emailField.text);
                      if (isSuccess) {
                        Fluttertoast.showToast(
                          msg: '메일을 보냈습니다.',
                          toastLength: Toast.LENGTH_SHORT,
                          backgroundColor: Colors.grey,
                          textColor: Colors.white,
                          fontSize: 16.0,
                        );
                        Navigator.pop(context);
                        print('메일 발신 성공');
                      } else {
                        print('메일 발신 실패');
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
    );
  }
}
