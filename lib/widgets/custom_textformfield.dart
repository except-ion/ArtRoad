import 'package:flutter/material.dart';

class CustomTextformfield extends StatelessWidget {
  final String name;
  final bool isPassword;
  final TextEditingController controller;
  final FocusNode focusNode;
  final String? Function(String?) validator; // 유효성 검사 함수

  const CustomTextformfield({
    Key? key,
    required this.name,
    required this.isPassword,
    required this.controller,
    required this.focusNode,
    required this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller, // 전달받은 controller 사용
      obscureText: isPassword, // 비밀번호 필드인 경우만 true로 설정
      focusNode: focusNode,
      validator: validator,
      style: const TextStyle(fontSize: 18),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(top: 25, left: 20, bottom: 10),
        labelText: name,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 3,
            color: Color(0xFF00233D),
          ),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
