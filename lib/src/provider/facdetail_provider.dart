import 'package:artroad/src/model/facdetail.dart';
import 'package:artroad/src/repository/facdetail_repo.dart';
import 'package:flutter/material.dart';

class FacilityDetailProvider extends ChangeNotifier {
  final FacilityDetailRepository _facilityDetailRepository = FacilityDetailRepository();

  List<FacilityDetail> _facilityDetails = [];
  List<FacilityDetail> get facilityDetails => _facilityDetails;

  // 데이터 로드
  loadFacilityDetails() async {
    List<FacilityDetail>? listFacilityDetails = await _facilityDetailRepository.loadFacilityDetails();
    _facilityDetails = listFacilityDetails!;
    notifyListeners();
  }
}