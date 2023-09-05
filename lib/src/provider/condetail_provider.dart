import 'package:artroad/src/model/condetail.dart';
import 'package:artroad/src/repository/condetail_repo.dart';
import 'package:flutter/material.dart';

class ConcertDetailProvider extends ChangeNotifier{
  final ConcertDetailRepository _concertDetailRepository = ConcertDetailRepository();

  List<ConcertDetail> _concertDetails = [];
  List<ConcertDetail> get concertDetails => _concertDetails;

  loadConcertDetails(String concertID) async {
    try {
      List<ConcertDetail>? listConcertDetails = await _concertDetailRepository.loadConcertDetails(concertID);
      if (listConcertDetails != null) {
        _concertDetails = listConcertDetails;
        notifyListeners();
      }
    } catch (error) {
      print("Error loading concert details: $error");
    }
  } 
}