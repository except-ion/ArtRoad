import 'package:artroad/src/model/facility.dart';
import 'package:artroad/src/repository/search/facility_repo.dart';
import 'package:flutter/material.dart';

class FacilityProvider extends ChangeNotifier {
  final FacilityRepository _facilityRepository = FacilityRepository();

  List<Facility> _facilities = [];
  List<Facility> get concerts => _facilities;

  // 데이터 로드
  loadFacilities() async {
    List<Facility>? listFacilities = await _facilityRepository.loadFacilities();
    _facilities = listFacilities!;
    notifyListeners();
  }
}