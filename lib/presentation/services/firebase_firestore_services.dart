import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';

// Firestore 컬렉션 및 문서 참조
final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _schedulesCollection = _firestore.collection('schedules');

class FirebaseStoreService{
  // 일정 추가
  Future<void> addSchedule(String userId, String title, DateTime date, String alarm, String color, String link) async {
    try {
      await _schedulesCollection.doc(userId).collection('user_schedules').add({
        'title': title,
        'date': date,
        'alarm': alarm,
        'color': color, // 컬러를 문자열로 저장 (예: "Color(0xFF176FF2)")
        'link': link,
      });
    } catch (e) {
      print('일정 추가 실패: $e');
    }
  }

  // 사용자의 모든 일정 가져오기
  Stream<QuerySnapshot> getUserSchedules(String userId) {
    return _schedulesCollection.doc(userId).collection('user_schedules').snapshots();
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

