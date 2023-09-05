import 'package:artroad/presentation/calendar/favoritecalendar_screen/favoritecalendar_bottom/fcalendar_items_tile.dart';
import 'package:artroad/presentation/services/firebase_firestore_services.dart';
import 'package:artroad/src/provider/user_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'fcalendar_items.dart';

class fCalendarListView extends StatelessWidget {
  final FirebaseStoreService _firebaseStoreService = FirebaseStoreService();

  fCalendarListView({super.key});

  Future<List<fCalendarItems>> getUserLikedConcert(String? userId) async {
    final List<fCalendarItems> fcalendarList = await _firebaseStoreService.getUserLikedConcert(userId!);
    print('fcalendarList: $fcalendarList');
    return fcalendarList;
  }
  // = [
  //   fCalendarItems(null, 'Concert Name 1', 'facility Name 1', '2023.01.01', '2023.01.02'),
  //   fCalendarItems(null, 'Concert Name 2', 'facility Name 2', '2023.02.01', null),
  //   fCalendarItems(null, 'Concert Name 3', 'facility Name 3', '2023.03.01', '2023.03.02'),
  // ];

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    String? userId = userProvider.firebaseUserId;

    return FutureBuilder<List<fCalendarItems>>(
      future: getUserLikedConcert(userId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // 데이터 로딩 중일 때 표시할 UI
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          // 오류가 발생했을 때 표시할 UI
          return Text('오류 발생: ${snapshot.error}');
        } else {
          // 데이터를 성공적으로 불러왔을 때 표시할 UI
          List<fCalendarItems> fcalendarList = snapshot.data ?? [];
    
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                  child: ListView.builder(
                    shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.all(20),
                      itemCount: fcalendarList.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.only(bottom: 15), // 원하는 여백 값
                          child: fCalendarItemsTile(fcalendarList[index]),
                        );
                      }
                  ),
              ),
            ],
          );
        }
      },
    );
  }
}