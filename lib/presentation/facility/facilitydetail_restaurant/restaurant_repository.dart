import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:artroad/presentation/facility/facilitydetail_restaurant/restaurant_items.dart';
import 'package:xml2json/xml2json.dart';
import 'dart:convert' as convert;

class RestaurantItemsRepository {
  Future<List<RestaurantItems>?> loadKakaoRestaurants() async {
    String lng="127.05902969025047";
    String lat="37.51207412593136";
    final String url = 
      "https://dapi.kakao.com/v2/local/search/category.json?category_group_code=FD6&x=$lng&y=$lat";

    final response = await http.get(
      Uri.parse(url),
      headers: {
        'Authorization': 'KakaoAK 96186d771fe1f266518a71fee36ba25a',
      },
    );

    if (response.statusCode == 200) {
      final parsed = jsonDecode(response.body);
      final jsonData = parsed['documents'];
      print('jsonData $jsonData');
      return jsonData.map<RestaurantItems>((json) => RestaurantItems.fromJson(json)).toList();
    }
    return null;
  }
}
