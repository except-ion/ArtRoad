//가져온 데이터 알려주는 역할

import 'package:artroad/src/model/concert.dart';
import 'package:artroad/src/repository/concert_repo.dart';
import 'package:flutter/material.dart';

class ConcertProvider extends ChangeNotifier {
  // EvRepository를 접근(데이터를 받아와야 하기 때문에)
  final ConcertRepository _concertRepository = ConcertRepository();

  List<Concert> _concerts = [];
  List<Concert> get concerts => _concerts;

  // 데이터 로드
  loadConcerts() async {
    // EvRepository 접근해서 데이터를 로드
    // listEvs에 _evs를 바로 작성해도 되지만 예외 처리와 추가적인 가공을 위해 나눠서 작성한다.
    List<Concert>? listConcerts = await _concertRepository.loadConcerts();
    _concerts = listConcerts!;
    notifyListeners(); // 데이터가 업데이트가 됐으면 구독자에게 알린다.
  }
}