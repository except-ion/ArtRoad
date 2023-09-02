import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'accommodation_items.dart';
import 'accommodation_items_tile.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class AccommodationListView extends StatefulWidget {
  const AccommodationListView({super.key});

  @override
  _AccommodationListViewState createState() => _AccommodationListViewState();
}

class _AccommodationListViewState extends State<AccommodationListView> {
  List<AccommodationItems> accommodationList = [];
  @override
  void initState() {
    super.initState();
    fetchAccommodationData();
  }

  Future<void> fetchAccommodationData() async {
    String lng="127.05902969025047";
    String lat="37.51207412593136";
    final String url = 
      "https://dapi.kakao.com/v2/local/search/category.json?category_group_code=AD5&x=$lng&y=$lat";

    final response = await http.get(
      Uri.parse(url),
      headers: {
        'Authorization': 'KakaoAK 96186d771fe1f266518a71fee36ba25a',
      },
    );
    if (response.statusCode == 200) {
      // API 응답 데이터를 파싱하고 AccommodationItems 객체로 변환하여 리스트에 추가합니다.
      final jsonData = json.decode(response.body);
      final List<AccommodationItems> apiAccommodationList = [];
      for (var item in jsonData['documents']) {
        apiAccommodationList.add(AccommodationItems(
          item['place_name'] ?? "Unknown",
          item['category_name'] ?? "Unknown",
          item['road_address_name'] ?? "Unknown",
          item['distance'] ?? "Unknown",
          item['phone'] ?? "Unknown",
        ));
      }

      setState(() {
        accommodationList = apiAccommodationList;
      });
    } else {
      throw Exception('Failed to load data from the API');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize :MainAxisSize.min,
      children: [
        Flexible(
          child: ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.all(20),
            itemCount: accommodationList.length,
            itemBuilder: (context, index) {
              return AccommodationItemsTile(accommodationList[index]);
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