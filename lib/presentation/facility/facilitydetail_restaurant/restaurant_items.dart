import 'dart:core';

class RestaurantItems {
  String rName;
  String rType;
  String rAdress;
  int rDistance;
  String rPhoneNum;
  
  //kakao api 
  // final String? placeName; //장소명
  // final String? distance; //공연시설부터의 거리
  // final String? roadAddressName; //도로명 주소
  // final String? phone; //전화번호
  // final String? categoryName; //식당 카테고리

  RestaurantItems(
    this.rName, 
    this.rType,
    this.rAdress, 
    this.rDistance, 
    this.rPhoneNum
  );

//   RestaurantItems({
//     this.placeName,
//     this.distance,
//     this.roadAddressName,
//     this.phone,
//     this.categoryName
// });

  // factory RestaurantItems.fromJson(Map<String, dynamic> json) {
  //   return RestaurantItems(
  //     placeName: json["place_name"] as String?,
  //     distance: json["distance"] as String?,
  //     roadAddressName: json["road_address_name"] as String?,
  //     phone: json["phone"] as String?,
  //     categoryName: json["category_name"] as String?,
  //   );
  // }
}