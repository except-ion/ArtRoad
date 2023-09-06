import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class CustomHeader extends StatefulWidget {
  final String? name;
  final bool hasLiked;
  final bool isDetail;

  const CustomHeader(
      {Key? key, this.name = '', this.hasLiked = false, this.isDetail = false});

  @override
  _CustomHeaderState createState() => _CustomHeaderState();
}

class _CustomHeaderState extends State<CustomHeader> {
  bool isLiked = false;

  @override
  void initState() {
    super.initState();
    isLiked = widget.hasLiked;
  }

  //좋아요 클릭 유무
  void toggleLiked() {
    setState(() {
      isLiked = !isLiked;
    });
  }

  @override
  Widget build(BuildContext context) {
    print(widget.isDetail);
    return Container(
      height: 70,
      child: Stack(
        children: [
          widget.isDetail
              ? Image.asset('assets/images/header_dark.png')
              : Image.asset('assets/images/header_light.png'),
          Padding(
            padding: EdgeInsets.only(top: 10, left: 15, right: 15, bottom: 5),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: FittedBox(
                    // 텍스트에 FittedBox 적용
                    fit: BoxFit.fitHeight,
                    child: AutoSizeText(
                      widget.name!,
                      style: TextStyle(
                        color: widget.isDetail ? Colors.white : Colors.black,
                        fontSize: 21,
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      maxFontSize: 21,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8,bottom: 8),
                      child: Transform.scale(
                        alignment: Alignment.center,
                        scale: 1.5,
                        child: IconButton(
                          icon: Icon(
                            Icons.arrow_back_rounded,
                            color: widget.isDetail
                                ? Colors.white
                                : Color(0xFF00233D),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ),
                    if (widget.hasLiked)
                      Transform.scale(
                        scale: 1.5,
                        child: IconButton(
                          icon: FittedBox(
                            // 아이콘에 FittedBox 적용
                            fit: BoxFit.contain,
                            child: isLiked
                                ? Icon(
                                    //좋아요 클릭 전
                                    Icons.favorite_border,
                                    color: widget.isDetail
                                        ? Colors.white
                                        : Color(0xFF00233D),
                                  )
                                : Icon(
                                    //좋아요 클릭 후
                                    Icons.favorite,
                                    color: Colors.red,
                                  ),
                          ),
                          onPressed: toggleLiked,
                        ),
                      ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
