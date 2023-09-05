import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../widgets/custom_header.dart';
import '../../widgets/custom_launch_url.dart';
import 'facilitydetail_accommodation/accommodation_list_view.dart';
import 'facilitydetail_info_icons.dart';
import 'facilitydetail_restaurant/restaurant_list_view.dart';
import '../../src/model/facdetail.dart';

class FacilityDetailScreen extends StatefulWidget {
  const FacilityDetailScreen({Key? key}) : super(key: key);

  @override
  _FacilityDetailScreenState createState() => _FacilityDetailScreenState();
}

class _FacilityDetailScreenState extends State<FacilityDetailScreen> {
  FacilityDetail facility = FacilityDetail(
      mt10id: 'FC223076',
      fcltynm: '예술의 전당 오페라 극장',
      telno: '1668-1352',
      relateurl: 'https://www.ksponco.or.kr/olympicpark/',
      adres: '서울 서초구 남부순환로 2406',
      la: '123',
      lo: '123' );

  // FacilityDetail facility = FacilityDetail(
  //     mt10id: null,
  //     fcltynm: null,
  //     telno: null,
  //     relateurl: null,
  //     adres: null,
  //     la: '123',
  //     lo: '123' );

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
                                      (facility.adres == null) ?
                                          Text(
                                            "주소 정보 없음",
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Color(0xFF939191),
                                            ),
                                          )
                                          :
                                          Text(
                                            '${facility.adres}',
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Color(0xFF939191),
                                            ),
                                          ),
                                      SizedBox(width: 5),
                                      if (facility.adres != null)
                                        InkWell(
                                          onTap: () {
                                            // 텍스트 복사 로직 구현
                                            Clipboard.setData(ClipboardData(text: '${facility.adres}'));
                                            Fluttertoast.showToast(
                                              msg: '주소가 복사되었습니다.',
                                              toastLength: Toast.LENGTH_SHORT,
                                              backgroundColor: Colors.grey,
                                              textColor: Colors.white,
                                              fontSize: 16.0,
                                            );
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
                                      (facility.telno == null) ?
                                          Text(
                                            "전화번호 정보 없음",
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Color(0xFF939191),
                                            ),
                                          )
                                          :
                                          Text(
                                            '${facility.telno}',
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: Color(0xFF939191),
                                            ),
                                          ),
                                      SizedBox(width: 5),
                                      if(facility.telno != null)
                                        InkWell(
                                          onTap: () {
                                            // 텍스트 복사 로직 구현
                                            Clipboard.setData(ClipboardData(text: '${facility.telno}',));
                                            Fluttertoast.showToast(
                                              msg: '전화번호가 복사되었습니다.',
                                              toastLength: Toast.LENGTH_SHORT,
                                              backgroundColor: Colors.grey,
                                              textColor: Colors.white,
                                              fontSize: 16.0,
                                            );
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
                                  InkWell(
                                    onTap: () {
                                      if(facility.relateurl != null)
                                        CustomLaunchUrl('${facility.relateurl}');
                                    },
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.link_rounded,
                                          color: Color(0xFF939191),
                                          size: 20,
                                        ),
                                        SizedBox(width: 5),
                                        (facility.relateurl == null) ?
                                            Text(
                                              '사이트 링크 없음',
                                              style: TextStyle(
                                                fontSize: 16,
                                                color: Color(0xFF939191),
                                              ),
                                            )
                                            :
                                            Flexible(
                                                child: Text(
                                                  '${facility.relateurl}',
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    color: Color(0xFF939191),
                                                  ),
                                                  maxLines: 2, // 텍스트가 최대 2줄로 표시되도록 설정 (원하는 줄 수로 조정 가능)
                                                  overflow: TextOverflow.ellipsis,
                                                ),
                                            ),
                                      ],
                                    ),
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
                                        child: FacilityDetailInfoIcons('${facility.mt10id}'),
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
                                                '음식점',
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
                          child: (facility.fcltynm == null) ?
                              Text(
                                '공연장 이름 없음',
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              )
                              :
                              Text(
                                '${facility.fcltynm}',
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
