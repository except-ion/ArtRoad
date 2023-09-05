import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/image_constant.dart';
import 'mcalendar_items.dart';

class mCalendarItemsTile extends StatelessWidget {
  mCalendarItemsTile(this._mCalendarItems);

  final mCalendarItems _mCalendarItems;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: 0,
          top: 1,
          child: Image.asset(
            ImageConstant.imageVerticalLine,
            color: _mCalendarItems.schcolor,
          ),
        ),

        SizedBox(width: 10),

        ListTile(
          title: Text(
            _mCalendarItems.schname,
            style: TextStyle(
              color: _mCalendarItems.schcolor,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),

          subtitle: Column(
            children: [
              SizedBox(height: 3.5),

              Row(
                children: [
                  Text(
                    _mCalendarItems.schdate,
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF939191),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 3),

              Row(
                children: [
                  Icon(
                    Icons.alarm_rounded,
                    color: Color(0xFF939191),
                    size: 18,
                  ),

                  SizedBox(width: 2.5),

                  Text(
                    _mCalendarItems.schalarm,
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF939191),
                    ),
                  ),
                ],
              )
            ],
          ),

          trailing: _mCalendarItems.schlink != null
              ? InkWell(
            onTap: () {
              print("link button clicked");
            },
            child: Icon(
              Icons.link_rounded,
              color: Color(0xFF939191),
              size: 30,
            ),
          )
              : null,
        ),
      ],
    );
  }
}