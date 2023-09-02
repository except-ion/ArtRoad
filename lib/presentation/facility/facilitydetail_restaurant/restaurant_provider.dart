// import 'package:flutter/material.dart';
// import 'package:artroad/presentation/facility/facilitydetail_restaurant/restaurant_items.dart';
// import 'package:artroad/presentation/facility/facilitydetail_restaurant/restaurant_repository.dart';


// class RestaurantItemsProvider extends ChangeNotifier {
//   final RestaurantItemsRepository _restaurantItemsRepository = RestaurantItemsRepository();

//   List<RestaurantItems> _restaurantList = [];
//   List<RestaurantItems> get restaurantItems => _restaurantList;

//   // 데이터 로드
//   loadKakaoRestaurants() async {
//     List<RestaurantItems>? restaurantList = await _restaurantItemsRepository.loadKakaoRestaurants();
//     if (restaurantList != null) {
//       _restaurantList = restaurantList;
//       notifyListeners();
//     }
//   }
// }