import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class CustomDetailText extends StatelessWidget {
  final String type;
  final String? content;
  final VoidCallback? onPressed; // 더보기 클릭시 이동 함수

  const CustomDetailText({
    Key? key,
    required this.type,
    this.content,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: Container(
        width: double.infinity,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                type,
                style: TextStyle(
                  color: Color(0xFF939191),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Positioned(
              left: 80,
              top: -1,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: AutoSizeText(
                      '$content',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                      overflow: TextOverflow.clip, // 텍스트 넘침 처리
                      maxLines: 1, // 최대 줄 수
                    ),
                  ),
                  if (onPressed != null)
                    InkWell(
                      onTap: onPressed,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 7,
                          ),
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              '더보기',
                              style: TextStyle(
                                color: Color(0xFF176EF2),
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: Color(0xFF176EF2),
                            size: 19,
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
