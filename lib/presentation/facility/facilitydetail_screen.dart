import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../widgets/custom_header.dart';
import 'facilitydetail_accommodation/accommodation_list_view.dart';
import 'facilitydetail_info_icons.dart';
import 'facilitydetail_restaurant/restaurant_list_view.dart';

class FacilityDetailScreen extends StatefulWidget {
  const FacilityDetailScreen({Key? key}) : super(key: key);

  @override
  _FacilityDetailScreenState createState() => _FacilityDetailScreenState();
}

class _FacilityDetailScreenState extends State<FacilityDetailScreen> {
  bool isRestaurantSelected = true;
  bool isAccommodationSelected = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF00233D),
        body: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 230),
                          child: Container(
                            color: Colors.white,
                            width: double.infinity,
                            child: Padding(
                              padding: EdgeInsets.only(
                                top: 20,
                                left: 30,
                                right: 30,
                                bottom: 30,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                          Clipboard.setData(ClipboardData(
                                              text: '서울 서초구 남부순환로 2406'));
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
                                          Clipboard.setData(
                                              ClipboardData(text: '1668-1352'));
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
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Divider(),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '공연장 시설 정보',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          top: 20,
                                          bottom: 20,
                                        ),
                                        child: FacilityDetailInfoIcons(),
                                      ),
                                      Divider(),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
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
                                              width: screenWidth >= 600
                                                  ? 180
                                                  : screenWidth >= 400
                                                      ? 170
                                                      : 160,
                                              padding:
                                                  EdgeInsets.only(bottom: 11),
                                              decoration: BoxDecoration(
                                                border: isRestaurantSelected
                                                    ? Border(
                                                        bottom: BorderSide(
                                                            width: 3.5,
                                                            color:
                                                                Colors.black))
                                                    : Border(
                                                        bottom: BorderSide(
                                                            width: 1.5,
                                                            color: Color(
                                                                0xFFC7C7CC))),
                                              ),
                                              child: Text(
                                                '맛집',
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight:
                                                      isRestaurantSelected
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
                                              width: screenWidth >= 600
                                                  ? 180
                                                  : screenWidth >= 400
                                                      ? 170
                                                      : 160,
                                              padding:
                                                  EdgeInsets.only(bottom: 11),
                                              decoration: BoxDecoration(
                                                border: isAccommodationSelected
                                                    ? Border(
                                                        bottom: BorderSide(
                                                            width: 3.5,
                                                            color:
                                                                Colors.black))
                                                    : Border(
                                                        bottom: BorderSide(
                                                            width: 1.5,
                                                            color: Color(
                                                                0xFFC7C7CC))),
                                              ),
                                              child: Text(
                                                '숙소',
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight:
                                                      isAccommodationSelected
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
                                      if (isRestaurantSelected)
                                        RestaurantListView(),
                                      if (isAccommodationSelected)
                                        AccommodationListView(),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(30, 180),
                          child: Text(
                            '예술의 전당 오페라 극장',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            CustomHeader(
              isDetail: true,
            )
          ],
        ),
      ),
    );
  }
}
