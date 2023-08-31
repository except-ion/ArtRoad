import 'package:flutter/material.dart';

class CustomHeader extends StatelessWidget {
  final String? name;

  const CustomHeader({Key? key, this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(top: 50, left: 15, right: 15, bottom: 5),
        child: Stack(
          alignment: Alignment.center, // 중앙 정렬
          children: [
            Align(
              alignment: Alignment.topLeft, // 상단 좌측 정렬
              child: Transform.scale(
                scale: 1.5,
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_back_rounded,
                    color: Color(0xFF00233D),
                  ),
                  onPressed: () {
                    Navigator.pop(context); // 기본적으로 뒤로가기 기능 실행
                  },
                ),
              ),
            ),
            if (name != null)
              Text(
                name!,
                style: TextStyle(
                  color: Color(0xFF00233D),
                  fontSize: 21,
                ),
                textAlign: TextAlign.center,
              ),
          ],
        ),
      ),
    );
  }
}
