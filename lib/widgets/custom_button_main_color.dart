import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class CustomButtonMainColor extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const CustomButtonMainColor({
    Key? key,
    required this.onPressed,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        backgroundColor: const Color(0xFF00233D),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        minimumSize: const Size(350, 50),
      ),
      child: AutoSizeText(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
