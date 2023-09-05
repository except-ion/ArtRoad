import 'package:flutter/material.dart';

class CustomHeader extends StatefulWidget {
  final String? name;
  final bool hasLiked;
  final bool isDetail;

  const CustomHeader(
      {super.key, this.name, this.hasLiked = false, this.isDetail = false});

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
    return Container(
      child: Stack(
        children: [
          widget.isDetail
              ? Image.asset('assets/images/header_dark.png')
              : Image.asset('assets/images/header_light.png'),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 15, right: 15, bottom: 5),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Transform.scale(
                    scale: 1.5,
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back_rounded,
                        color:
                            widget.isDetail ? Colors.white : const Color(0xFF00233D),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
                if (widget.name != null)
                  Positioned(
                    top: 14,
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Text(
                        widget.name!,
                        style: TextStyle(
                          color: widget.isDetail ? Colors.white : Colors.black,
                          fontSize: 21,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                if (widget.hasLiked)
                  Positioned(
                    right: 0,
                    top: 0,
                    child: Transform.scale(
                      scale: 1.5,
                      child: IconButton(
                        icon: isLiked
                            ? Icon(
                                //좋아요 클릭 전
                                Icons.favorite_border,
                                color: widget.isDetail
                                    ? Colors.white
                                    : const Color(0xFF00233D),
                              )
                            : const Icon(
                                //좋아요 클릭 후
                                Icons.favorite,
                                color: Colors.red,
                              ),
                        onPressed: toggleLiked,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
