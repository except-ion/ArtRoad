import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

class FacilityDetailInfoIcons extends StatefulWidget {
  final String desiredFacilityCode;

  const FacilityDetailInfoIcons(this.desiredFacilityCode, {Key? key}) : super(key: key);

  @override
  _FacilityDetailInfoIconsState createState() => _FacilityDetailInfoIconsState();
}

class _FacilityDetailInfoIconsState extends State<FacilityDetailInfoIcons> {
  late String desiredFacilityCode;

  @override
  void initState() {
    super.initState();
    desiredFacilityCode = widget.desiredFacilityCode; // 생성자에서 전달된 mt10id 값을 초기화
  }

  Future<List> readJson() async {
    final String response = await rootBundle.loadString('assets/facilitydetail_convinence.json');
    final data = await json.decode(response);

    final filteredItems = data.where((item) => item['facilityCode'] == desiredFacilityCode).toList();

    return filteredItems;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List>(
      future: readJson(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator(); // 데이터 로딩 중에는 로딩 스피너를 표시
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}'); // 오류가 발생한 경우 오류 메시지 표시
        } else if (snapshot.data == null || (snapshot.data is List && (snapshot.data as List).isEmpty)) {
          return Text(
            "시설 정보를 제공하지 않는 공연장입니다.",
            style: TextStyle(
              fontSize: 14,
              color: Color(0xFF939191),
            ),
          ); // 데이터가 없거나 빈 경우 처리
        }
        else {
          // 데이터가 준비되면 UI를 렌더링
          final facilityInfoList = snapshot.data;

          if (facilityInfoList != null && facilityInfoList.isNotEmpty) {
            // facilityInfoList가 널이 아니고 비어있지 않을 때만 접근
            final item = facilityInfoList[0];
            return Container(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // 레스토랑
                      Column(
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              color: item['restaurant'] == 'Y' ? Color(0xFF176FF2) : Color(0xFF939191),
                              borderRadius: BorderRadius.circular(20), // 모서리 둥글기 설정
                            ),
                            child: const Center(
                              child:
                              Icon(
                                Icons.restaurant,
                                color: Colors.white,
                                size: 35,
                              ),
                            ),
                          ),

                          const SizedBox(height: 2),

                          const Text(
                            '레스토랑',
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFF939191),
                            ),
                          ),
                        ],
                      ),

                      // 카페
                      Column(
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              color: item['cafe'] == 'Y' ? Color(0xFF176FF2) : Color(0xFF939191),
                              borderRadius: BorderRadius.circular(20), // 모서리 둥글기 설정
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.local_cafe_rounded,
                                color: Colors.white,
                                size: 35,
                              ),
                            ),
                          ),

                          const SizedBox(height: 2),

                          const Text(
                            '카페',
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFF939191),
                            ),
                          ),
                        ],
                      ),

                      // 편의점
                      Column(
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              color: item['convinenceStore'] == 'Y' ? Color(0xFF176FF2) : Color(0xFF939191),
                              borderRadius: BorderRadius.circular(20), // 모서리 둥글기 설정
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.local_convenience_store_rounded,
                                color: Colors.white,
                                size: 35,
                              ),
                            ),
                          ),

                          const SizedBox(height: 2),

                          const Text(
                            '편의점',
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFF939191),
                            ),
                          ),
                        ],
                      ),

                      // 놀이방
                      Column(
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              color: item['playground'] == 'Y' ? Color(0xFF176FF2) : Color(0xFF939191),
                              borderRadius: BorderRadius.circular(20), // 모서리 둥글기 설정
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.bedroom_baby_rounded,
                                color: Colors.white,
                                size: 35,
                              ),
                            ),
                          ),

                          const SizedBox(height: 2),

                          const Text(
                            '놀이방',
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFF939191),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // 수유실
                      Column(
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              color: item['nursingRoom'] == 'Y' ? Color(0xFF176FF2) : Color(0xFF939191),
                              borderRadius: BorderRadius.circular(20), // 모서리 둥글기 설정
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.child_care_rounded,
                                color: Colors.white,
                                size: 35,
                              ),
                            ),
                          ),

                          const SizedBox(height: 2),

                          const Text(
                            '수유실',
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFF939191),
                            ),
                          ),
                        ],
                      ),

                      // 장애인 화장실
                      Column(
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              color: item['toilet'] == 'Y' ? Color(0xFF176FF2) : Color(0xFF939191),
                              borderRadius: BorderRadius.circular(20), // 모서리 둥글기 설정
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.wheelchair_pickup_rounded,
                                color: Colors.white,
                                size: 35,
                              ),
                            ),
                          ),

                          const SizedBox(height: 2),

                          const Text(
                            '장애인 화장실',
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFF939191),
                            ),
                          ),
                        ],
                      ),

                      // 엘리베이터
                      Column(
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              color: item['elevator'] == 'Y' ? Color(0xFF176FF2) : Color(0xFF939191),
                              borderRadius: BorderRadius.circular(20), // 모서리 둥글기 설정
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.elevator_rounded,
                                color: Colors.white,
                                size: 35,
                              ),
                            ),
                          ),

                          const SizedBox(height: 2),

                          const Text(
                            '엘리베이터',
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFF939191),
                            ),
                          ),
                        ],
                      ),

                      // 주차장
                      Column(
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              color: item['parking'] == 'Y' ? Color(0xFF176FF2) : Color(0xFF939191),
                              borderRadius: BorderRadius.circular(20), // 모서리 둥글기 설정
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.local_parking_rounded,
                                color: Colors.white,
                                size: 35,
                              ),
                            ),
                          ),

                          const SizedBox(height: 2),

                          const Text(
                            '주차장',
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFF939191),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            );
          } else {
            return Container(
              child: Text(
                '데이터 준비 중입니다.',
              ),
            );
          }
        }
      },
    );
  }
}

