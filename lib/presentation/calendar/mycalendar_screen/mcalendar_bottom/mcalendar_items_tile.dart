import 'package:artroad/presentation/calendar/mycalendar_screen/mcalendar_bottom/mcalendar_show_schedule_dialog.dart';
import 'package:artroad/presentation/calendar/mycalendar_screen/mcalendar_bottom/mcalendar_show_selected_dialog.dart';
import 'package:artroad/presentation/services/firebase_firestore_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../core/utils/image_constant.dart';
import '../../../../widgets/custom_launch_url.dart';
import 'mcalendar_items.dart';

class mCalendarItemsTile extends StatelessWidget {
  String userId;
  
  mCalendarItemsTile(
    this._mCalendarItems, 
    this.userId,
    {super.key}
  );

  final mCalendarItems _mCalendarItems;

  @override
  Widget build(BuildContext context) {
    final FirebaseStoreService firebaseStoreService = FirebaseStoreService();

    // String dateString = _mCalendarItems.schdate;
    // dateString = dateString.replaceAll(".", "-"); // 형식을 변경 (예: "2023-03-01")
    // DateTime parsedDate = DateTime.parse(dateString);

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

        const SizedBox(width: 10),

        ListTile(
          onTap: () async {
            //tile에서 눌렀을때 뜨는 dialog
            mCalendarItems? getSchedule = await firebaseStoreService.getUserSelectedSchedule(userId,  _mCalendarItems.scheduleId);
              if (getSchedule != null) {
                // Fetch and display existing schedule data
                showSelectedDialog(context, getSchedule, userId);
              } else {
                return;
              }
          },
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
              const SizedBox(height: 3.5),

              Row(
                children: [
                  Text(
                    DateFormat('yyyy.MM.dd').format(_mCalendarItems.schdate),
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFF939191),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 3),

              Row(
                children: [
                  const Icon(
                    Icons.alarm_rounded,
                    color: Color(0xFF939191),
                    size: 18,
                  ),

                  const SizedBox(width: 2.5),

                  Text(
                    _mCalendarItems.schalarm,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFF939191),
                    ),
                  ),
                ],
              )
            ],
          ),
          trailing: (_mCalendarItems.schlink != null) ?
              InkWell(
                  onTap: () {
                    if(_mCalendarItems.schlink != null) {
                      CustomLaunchUrl('${_mCalendarItems.schlink}');
                    }
                    print("link button clicked");
                  },
                  child: const Icon(
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