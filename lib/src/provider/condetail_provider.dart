import 'package:artroad/src/model/condetail.dart';
import 'package:artroad/src/repository/condetail_repo.dart';
import 'package:flutter/material.dart';

class ConcertDetailProvider extends ChangeNotifier{
  final ConcertDetailRepository _concertDetailRepository = ConcertDetailRepository();

  List<ConcertDetail> _concertDetails = [];
  List<ConcertDetail> get concertDetails => _concertDetails;

  loadConcertDetails() async {
    List<ConcertDetail>? listConcertDetails = await _concertDetailRepository.loadConcertDetails();
    _concertDetails = listConcertDetails!;
    notifyListeners();
  }
}