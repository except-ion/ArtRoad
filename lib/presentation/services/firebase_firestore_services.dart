import 'dart:ui';

import 'package:artroad/presentation/calendar/mycalendar_screen/mcalendar_bottom/mcalendar_items.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

// Firestore 컬렉션 및 문서 참조
final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _schedulesCollection = _firestore.collection('schedules');
final CollectionReference _likedConcertsCollection = _firestore.collection('likedConcert');

class FirebaseStoreService{
  //일정 추가
  Future<bool> addSchedule(String? userId, String title, DateTime date, String alarm, int color, String link) async {
    if (userId != null) {
      try {
        DocumentReference documentReference = await _schedulesCollection.doc(userId).collection('user_schedules').add({
          'title': title,
          'date': Timestamp.fromDate(date),
          'alarm': alarm,
          'color': color,
          'link': link,
        });
        String scheduleId = documentReference.id;
        return true;
      } catch (e) {
        print('일정 추가 실패: $e');
        return false;
      }
    }
    return false;
  }

  // 사용자의 일정 가져오기
  Future<List<mCalendarItems>> getUserSchedules(
    String? userId,
    DateTime date
    ) async {
    List<mCalendarItems> schedules = [];
    if (userId != null) {
      try {
        QuerySnapshot querySnapshot = await _schedulesCollection
            .doc(userId)
            .collection('user_schedules')
            .where('date', isGreaterThanOrEqualTo: date, isLessThanOrEqualTo: date)
            .get();
        
        for (var doc in querySnapshot.docs) {
          Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
          Color color = Color(int.parse(data['color'].toString()));

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
      return schedules;

    } catch (e) {
      print('일정 가져오기 실패: $e');
      return [];
      }
    }
    return [];
  }

  // 일정 수정
  Future<void> updateSchedule(String? userId, String scheduleId, String title, DateTime date, String alarm, int color, String link) async {
    try {
      await _schedulesCollection.doc(userId).collection('user_schedules').doc(scheduleId).update({
        'title': title,
        'date': Timestamp.fromDate(date),
        'alarm': alarm,
        'color': color,
        'link': link,
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

  Future<void> updateLikeStatus(String userId, String concertID, String prfnm, String concertDate, bool isLiked) async {
    if (!isLiked) {
      // 좋아요를 누른 경우, 데이터를 추가
      await addLikedStatus(userId, concertID, prfnm, concertDate);
    } else {
      // 좋아요를 취소한 경우, 데이터를 삭제
      await removeLikedStatus(userId, concertID);
    }
  }

  //좋아요 누른 경우 추가
  Future<void> addLikedStatus(String userId, String concertID, String prfnm, String concertDate) async {
    try {
      await _likedConcertsCollection.doc(userId).collection('user_liked_concerts').doc(concertID).set({
        'prfnm': prfnm,
        'prfpd': concertDate,
        'timestamp': FieldValue.serverTimestamp(), // 좋아요한 시간 기록
      });
    } catch (e) {
      print('좋아요 누른 공연 추가 실패: $e');
    }
  }

  //좋아요 누른 경우 삭제
  Future<void> removeLikedStatus(String userId, String concertID) async {
    try {
      await _likedConcertsCollection.doc(userId).collection('user_liked_concerts').doc(concertID).delete();
    } catch (e) {
      print('좋아요 누른 공연 삭제 실패: $e');
    }
  }

  //concertDetailScreen Header 초기 상태
  Future<bool> getLikedStatus(String userId, String concertID) async {
    try {
        DocumentSnapshot documentSnapshot = await _likedConcertsCollection
            .doc(userId)
            .collection('user_liked_concerts')
            .doc(concertID)
            .get();
      if (documentSnapshot.exists) {
        return false;
      } else {
        return true;
      }
    } catch (e) {
      print('좋아요 누른 공연 추가 실패: $e');
      return true;
    }
  }

  //favorite Calendar 정보 불러오기
  Future<bool> getLikedConcert(String userId, String concertID) async {
    try {
        DocumentSnapshot documentSnapshot = await _likedConcertsCollection
            .doc(userId)
            .collection('user_liked_concerts')
            .doc(concertID)
            .get();
      if (documentSnapshot.exists) {
        return false;
      } else {
        return true;
      }
    } catch (e) {
      print('좋아요 누른 공연 추가 실패: $e');
      return true;
    }
  }

}

