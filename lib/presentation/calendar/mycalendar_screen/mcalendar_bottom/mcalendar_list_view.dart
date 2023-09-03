import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'mcalendar_items.dart';
import 'mcalendar_items_tile.dart';
import 'package:artroad/src/provider/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:artroad/presentation/services/firebase_firestore_services.dart';

class mCalendarListView extends StatelessWidget {
  final FirebaseStoreService _firebaseStoreService = FirebaseStoreService();

  mCalendarListView({super.key});
  Future<List<mCalendarItems>> getScheduleData(String? userId) async {
    final List<mCalendarItems> mcalendarList = await _firebaseStoreService.getUserSchedules(userId);
    print('mcalendarList: $mcalendarList');
    return mcalendarList;
  }
  // final List<mCalendarItems> mcalendarList = [
  //   mCalendarItems(null, 'Schedule Name 1', '2023.01.01', '링크있음', '없음', Colors.red),
  //   mCalendarItems(null, 'Schedule Name 2', '2023.02.01', null, '1일 전', Colors.orange),
  //   mCalendarItems(null, 'Schedule Name 3', '2023.03.01', '링크있음', '1주일 전', Colors.purple),
  // ];

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    String? userId = userProvider.firebaseUserId;

    return FutureBuilder<List<mCalendarItems>>(
      future: getScheduleData(userId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // 데이터 로딩 중일 때 표시할 UI
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          // 오류가 발생했을 때 표시할 UI
          return Text('오류 발생: ${snapshot.error}');
        } else {
          // 데이터를 성공적으로 불러왔을 때 표시할 UI
          List<mCalendarItems> mcalendarList = snapshot.data ?? [];

          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.all(20),
                  itemCount: mcalendarList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.only(bottom: 15), // 원하는 여백 값
                      child: mCalendarItemsTile(mcalendarList[index]),
                    );
                  },
                ),
              ),
            ],
          );
        }
      },
    );
  }
}