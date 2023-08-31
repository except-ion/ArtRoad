import 'package:artroad/presentation/basepage_screen/basepage_screen.dart';
import 'package:artroad/presentation/home/home_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => BasepageScreen(),
            ), // 로그인 화면으로 이동
          );
        },
        child: Text('Login'),
      ),
    );
  }
}
