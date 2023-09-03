import 'dart:ui';

import 'package:artroad/presentation/calendar/mycalendar_screen/mcalendar_bottom/mcalendar_items.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// Firestore 컬렉션 및 문서 참조
final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _schedulesCollection = _firestore.collection('schedules');

class FirebaseStoreService{
  // 일정 추가
  Future<bool> addSchedule(String? userId, String title, DateTime date, String alarm, int color, String link) async {
    if (userId != null) {
      try {
        await _schedulesCollection.doc(userId).collection('user_schedules').add({
          'title': title,
          'date': Timestamp.fromDate(date),
          'alarm': alarm,
          'color': color,
          'link': link,
        });
        return true;
      } catch (e) {
        print('일정 추가 실패: $e');
        return false;
      }
    }
    return false;
  }

  // 사용자의 모든 일정 가져오기
  Future<List<mCalendarItems>> getUserSchedules(String? userId) async {
    List<mCalendarItems> schedules = [];
    if (userId != null) {
      try {
        QuerySnapshot querySnapshot = await _schedulesCollection
            .doc(userId)
            .collection('user_schedules')
            .get();
        print('querySnapshot: $querySnapshot');
        
        for (var doc in querySnapshot.docs) {
          Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
          print('querySnapshot data: $data');
          // Firestore에 저장된 컬러 정보를 다시 Color로 파싱
          Color color = Color(int.parse(data['color'].toString()));

          // Schedule 객체를 생성하여 리스트에 추가
          schedules.add(
            mCalendarItems(
              data['title'],
              (data['date'] as Timestamp).toDate(),
              data['link'],
              data['alarm'],
              color,
            ),
          );
        }
        print('schedules data: $schedules');


      return schedules;

    } catch (e) {
      print('일정 가져오기 실패: $e');
      return [];
      }
    }
    return [];
  }

  // 일정 수정
  Future<void> updateSchedule(String userId, String scheduleId, String newTitle, DateTime newDate) async {
    try {
      await _schedulesCollection.doc(userId).collection('user_schedules').doc(scheduleId).update({
        'title': newTitle,
        'date': newDate,
      });
    } catch (e) {
      print('일정 수정 실패: $e');
    }
  }

  // 일정 삭제
  Future<void> deleteSchedule(String userId, String scheduleId) async {
    try {
      await _schedulesCollection.doc(userId).collection('user_schedules').doc(scheduleId).delete();
    } catch (e) {
      print('일정 삭제 실패: $e');
    }
  }
}

