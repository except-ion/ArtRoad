import 'package:flutter/material.dart';

class CustomHeader extends StatefulWidget {
  final String? name;
  final bool hasLiked;

  const CustomHeader({Key? key, this.name, this.hasLiked = false});

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
      child: Padding(
        padding: EdgeInsets.only(top: 50, left: 15, right: 15, bottom: 5),
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
                    color: Color(0xFF00233D),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
            if (widget.name != null)
              Text(
                widget.name!,
                style: TextStyle(
                  color: Color(0xFF00233D),
                  fontSize: 21,
                ),
                textAlign: TextAlign.center,
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
                            color: Colors.grey,
                          )
                        : Icon(
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
    );
  }
}
