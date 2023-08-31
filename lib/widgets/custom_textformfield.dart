import 'package:flutter/material.dart';

class CustomTextformfield extends StatelessWidget {
  final String name;
  final bool isPassword;
  final TextEditingController controller;

  const CustomTextformfield({
    Key? key,
    required this.name,
    required this.isPassword,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        TextFormField(
          controller: controller, // 전달받은 controller 사용
          obscureText: isPassword, // 비밀번호 필드인 경우만 true로 설정
          style: TextStyle(fontSize: 18),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(top: 25, left: 20, bottom: 10),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                width: 3,
                color: Color(0xFF00233D),
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        Positioned(
          top: -9,
          left: -13,
          child: Transform.translate(
            offset: Offset(30, 0),
            child: Stack(
              children: [
                SizedBox(
                  width: name.length * 10 + 20,
                  height: 15,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Text(
                      name,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        backgroundColor: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
