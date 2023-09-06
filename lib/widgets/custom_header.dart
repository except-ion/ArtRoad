import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class CustomHeader extends StatefulWidget {
  final String? name;
  final bool isDetail;

  const CustomHeader({super.key, this.name = '', this.isDetail = false});

  @override
  _CustomHeaderState createState() => _CustomHeaderState();
}

class _CustomHeaderState extends State<CustomHeader> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.isDetail);
    return Container(
      child: Stack(
        children: [
          widget.isDetail
              ? Image.asset('assets/images/header_dark.png')
              : Image.asset('assets/images/header_light.png'),
          Padding(
            padding:
                const EdgeInsets.only(top: 10, left: 15, right: 15, bottom: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 8),
                  child: Transform.scale(
                    alignment: Alignment.center,
                    scale: 1.5,
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back_rounded,
                        color: widget.isDetail
                            ? Colors.white
                            : const Color(0xFF00233D),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
