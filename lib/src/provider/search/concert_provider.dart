import 'package:artroad/src/model/concert.dart';
import 'package:artroad/src/repository/search/concert_repo.dart';
import 'package:flutter/material.dart';

class ConcertProvider extends ChangeNotifier {
  final ConcertRepository _concertRepository = ConcertRepository();

  List<Concert> _concerts = [];
  List<Concert> get concerts => _concerts;

  // 데이터 로드
  loadConcerts(String searchTerm) async {
    try {
      List<Concert>? listConcerts = await _concertRepository.loadConcerts(searchTerm);
      if(listConcerts != null) {
        _concerts = listConcerts;
        notifyListeners(); // 데이터가 업데이트가 됐으면 구독자에게 알린다.
      } 
      return concerts;
    } catch (error) {
    }
    return null;
  }
}