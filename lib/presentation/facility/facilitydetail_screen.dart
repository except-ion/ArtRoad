import 'package:artroad/core/app_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'facilitydetail_accommodation/accommodation_list_view.dart';
import 'facilitydetail_info_icons.dart';
import 'facilitydetail_restaurant/restaurant_list_view.dart';

class FacilityDetailScreen extends StatefulWidget {
  const FacilityDetailScreen({Key? key}) : super(key: key);

  @override
  _FacilityDetailScreen createState() => _FacilityDetailScreen();
}

class _FacilityDetailScreen extends State<FacilityDetailScreen> {
  bool isRestaurantSelected = true;
  bool isAccommodationSelected = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // --- 지도 ---

          Padding(
            padding: getPadding(top: 20, left: 20),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                '예술의 전당 오페라 극장',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),

          Padding(
            padding: getPadding(top: 20, left: 20, bottom: 30),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.location_on_sharp,
                      color: Color(0xFF939191),
                      size: 20,
                    ),
                    SizedBox(width: 5),
                    Text(
                      '서울 서초구 남부순환로 2406',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF939191),
                      ),
                    ),
                    SizedBox(width: 5),
                    InkWell(
                      onTap: () {
                        // 텍스트 복사 로직 구현
                        Clipboard.setData(
                            ClipboardData(text: '서울 서초구 남부순환로 2406'));
                        // 복사 완료 메시지 표시 등의 로직 추가 가능
                        print('adress copy bt');
                      },
                      child: Icon(
                        Icons.copy_rounded,
                        color: Color(0xFF176FF2),
                        size: 20,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 7),
                Row(
                  children: [
                    Icon(
                      Icons.call,
                      color: Color(0xFF939191),
                      size: 20,
                    ),
                    SizedBox(width: 5),
                    Text(
                      '1668-1352',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF939191),
                      ),
                    ),
                    SizedBox(width: 5),
                    InkWell(
                      onTap: () {
                        // 텍스트 복사 로직 구현
                        Clipboard.setData(ClipboardData(text: '1668-1352'));
                        // 복사 완료 메시지 표시 등의 로직 추가 가능
                        print('phone number copy bt');
                      },
                      child: Icon(
                        Icons.copy_rounded,
                        color: Color(0xFF176FF2),
                        size: 20,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 7),
                Row(
                  children: [
                    Icon(
                      Icons.link_rounded,
                      color: Color(0xFF939191),
                      size: 20,
                    ),
                    SizedBox(width: 5),
                    Text(
                      '사이트 링크 없음',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF939191),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            height: 1.5,
            width: 370,
            color: Color(0xFFC7C7CC),
          ),
          Column(
            children: [
              Padding(
                padding: getPadding(top: 30, bottom: 30),
                child: Text(
                  '공연장 시설 정보',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Padding(
                padding: getPadding(top: 0, bottom: 30, left: 40, right: 40),
                child: FacilityDetailInfoIcons(),
              ),
            ],
          ),
          Container(
            height: 1.5,
            width: 370,
            color: Color(0xFFC7C7CC),
          ),
          Padding(
              padding: getPadding(top: 11),
              child: Column(
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          setState(() {
                            isRestaurantSelected = true;
                            isAccommodationSelected = false;
                          });
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: 185,
                          margin: EdgeInsets.only(left: 20),
                          padding: EdgeInsets.only(bottom: 11),
                          decoration: BoxDecoration(
                            border: isRestaurantSelected
                                ? Border(
                                    bottom: BorderSide(
                                        width: 3.5, color: Colors.black))
                                : Border(
                                    bottom: BorderSide(
                                        width: 1.5, color: Color(0xFFC7C7CC))),
                          ),
                          child: Text(
                            '맛집',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: isRestaurantSelected
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                              color: isRestaurantSelected
                                  ? Colors.black
                                  : Color(0xFF939191),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            isRestaurantSelected = false;
                            isAccommodationSelected = true;
                          });
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: 185,
                          margin: EdgeInsets.only(right: 20),
                          padding: EdgeInsets.only(bottom: 11),
                          decoration: BoxDecoration(
                            border: isAccommodationSelected
                                ? Border(
                                    bottom: BorderSide(
                                        width: 3.5, color: Colors.black))
                                : Border(
                                    bottom: BorderSide(
                                        width: 1.5, color: Color(0xFFC7C7CC))),
                          ),
                          child: Text(
                            '숙소',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: isAccommodationSelected
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                              color: isAccommodationSelected
                                  ? Colors.black
                                  : Color(0xFF939191),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  if (isRestaurantSelected) RestaurantListView(),
                  if (isAccommodationSelected) AccommodationListView(),
                ],
              )),
        ],
      ),
    );
  }
}
