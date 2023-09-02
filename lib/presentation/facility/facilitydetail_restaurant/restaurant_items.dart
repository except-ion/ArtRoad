import 'dart:core';

class RestaurantItems {
  String place_name;
  String category_name;
  String road_address_name;
  String phone;
  String distance;

  RestaurantItems(
    this.place_name, 
    this.category_name,
    this.road_address_name, 
    this.phone, 
    this.distance
  );
}