import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'restaurant_items.dart';
import 'restaurant_items_tile.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class RestaurantListView extends StatefulWidget {
  const RestaurantListView({super.key});

  @override
  _RestaurantListViewState createState() => _RestaurantListViewState();
}

class _RestaurantListViewState extends State<RestaurantListView> {
  List<RestaurantItems> restaurantList = [];

  @override
  void initState() {
    super.initState();
    fetchRestaurantData();
  }

  Future<void> fetchRestaurantData() async {
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
      final jsonData = json.decode(response.body);
      final List<RestaurantItems> apiRestaurantList = [];
      for (var item in jsonData['documents']) {
        apiRestaurantList.add(RestaurantItems(
          item['place_name'] ?? "Unknown",
          item['category_name'] ?? "Unknown",
          item['road_address_name'] ?? "Unknown",
          item['distance'] ?? "Unknown",
          item['phone'] ?? "Unknown",
        ));
      }

      setState(() {
        restaurantList = apiRestaurantList;
      });
    } else {
      throw Exception('Failed to load data from the API');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.only(top: 20),
            itemCount: restaurantList.length,
            itemBuilder: (context, index) {
              return RestaurantItemsTile(restaurantList[index]);
            },
            separatorBuilder: (context, index) {
              return const Divider();
            },
          ),
        ),
      ],
    );
  }
}