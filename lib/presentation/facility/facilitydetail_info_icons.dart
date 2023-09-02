import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

class FacilityDetailInfoIcons extends StatefulWidget{
  const FacilityDetailInfoIcons({super.key});

  @override
  _FacilityDetailInfoIconsState createState() => _FacilityDetailInfoIconsState();
}

class _FacilityDetailInfoIconsState extends State<FacilityDetailInfoIcons> {
  List facilityInfoList = [];
  
  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/facilitydetail_convinence.json');
    final data = await json.decode(response);

    const desiredFacilityCode = "FC223076";
    final filteredItems = data.where((item) => item['facilityCode'] == desiredFacilityCode);
    setState(() {
      facilityInfoList = filteredItems;
    });
    print('facilityInfoList: $facilityInfoList');
    print('facilityInfoList[0]: $facilityInfoList[0]');
  }

  @override
  void initState(){
    super.initState();
    readJson();
  }

  @override
  Widget build(BuildContext context) {
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
                      color: const Color(0xFF176FF2), // 배경색
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
                      color: const Color(0xFF176FF2), // 배경색
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
                      color: const Color(0xFF176FF2), // 배경색
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
                      color: const Color(0xFF176FF2), // 배경색
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
                      color: const Color(0xFF176FF2), // 배경색
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
                      color: const Color(0xFF176FF2), // 배경색
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
                      color: const Color(0xFF176FF2), // 배경색
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
                      color: const Color(0xFF176FF2), // 배경색
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
  }
}