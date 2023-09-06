import 'package:artroad/src/model/facility.dart';
import 'package:artroad/src/repository/search/facility_repo.dart';
import 'package:flutter/material.dart';

class FacilityProvider extends ChangeNotifier {
  final FacilityRepository _facilityRepository = FacilityRepository();

  List<Facility> _facilities = [];
  List<Facility> get facilities => _facilities;

  // 데이터 로드
  loadFacilities(String searchTerm) async {
    try {
      List<Facility>? listFacilities = await _facilityRepository.loadFacilities(searchTerm);
      if(listFacilities != null) {
        _facilities = listFacilities;
        notifyListeners(); // 데이터가 업데이트가 됐으면 구독자에게 알린다.
      } 
      return facilities;
    } catch (error) {
      print("Error facility provider: $error");
    }
    return null;
  }
}