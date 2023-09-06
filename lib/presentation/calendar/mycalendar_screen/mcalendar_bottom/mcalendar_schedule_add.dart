import 'package:artroad/presentation/calendar/mycalendar_screen/mcalendar_bottom/mcalendar_show_schedule_dialog.dart';
import 'package:artroad/presentation/services/firebase_firestore_services.dart';
import 'package:artroad/src/provider/user_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class mCalendarScheduleAdd extends StatefulWidget {
  final DateTime selectedDay; // 선택된 날짜를 인자로 받도록 수정

  const mCalendarScheduleAdd({super.key, required this.selectedDay});

  get alarm => alarm;

  get colors => colors;

  @override
  _mCalendarScheduleAdd createState() => _mCalendarScheduleAdd();
}

class _mCalendarScheduleAdd extends State<mCalendarScheduleAdd> {
  final FirebaseStoreService _firebaseStoreService = FirebaseStoreService();
  
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    String? userId = userProvider.firebaseUserId;
    
    return Row(
      children: [
        InkWell(
          onTap: () {
            showScheduleDialog(context, widget.selectedDay, userId);
          },
          child: const Stack(
            children: [
              Icon(
                Icons.circle,
                color: Color(0xFF176FF2),
                size: 50,
              ),
              Positioned(
                top: 10,
                left: 10,
                child: Icon(
                  Icons.add_rounded,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}