import 'package:artroad/presentation/calendar/favoritecalendar_screen/favoritecalendar_bottom/fcalendar_items.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/image_constant.dart';

class fCalendarItemsTile extends StatelessWidget {
  fCalendarItemsTile(this._fCalendarItems);

  final fCalendarItems _fCalendarItems;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: 0,
          top: 1,
          child: Image.asset(
            ImageConstant.imageVerticalLine,
            color: Color(0xFF176FF2),
          ),
        ),

        SizedBox(width: 10),

        ListTile(
          title: Text(
            '${_fCalendarItems.prfnm}',
            style: TextStyle(
              color: Color(0xFF176FF2),
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),

          subtitle: Column(
            children: [
              SizedBox(height: 3.5),

              Row(
                children: [
                  if (_fCalendarItems.prfpdto == null)
                    Text(
                      '${_fCalendarItems.prfpdfrom}',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF939191),
                      ),
                    ),
                  if (_fCalendarItems.prfpdto != null)
                    Text(
                      '${_fCalendarItems.prfpdfrom} ~ ${_fCalendarItems.prfpdto}',
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
                    Icons.location_on_sharp,
                    color: Color(0xFF939191),
                    size: 18,
                  ),

                  SizedBox(width: 2.5),

                  InkWell(
                    onTap: () {
                      print('Move to facility detail page');
                    },
                    child: Text(
                      '${_fCalendarItems.fcltynm}',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF939191),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
          trailing: InkWell(
            onTap: () {
              print("Concert info button clicked");
            },
            child: Icon(
              Icons.keyboard_arrow_right_rounded,
              color: Color(0xFF939191),
              size: 30,
            ),
          ),
        )
      ],
    );
  }

}