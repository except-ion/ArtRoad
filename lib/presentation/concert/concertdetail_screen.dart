import 'package:artroad/widgets/custom_detail_text.dart';
import 'package:artroad/widgets/custom_header.dart';
import 'package:flutter/material.dart';

import '../../src/model/condetail.dart';
import '../facility/facilitydetail_screen.dart';

class ConcertDetailScreen extends StatefulWidget {
  ConcertDetailScreen({super.key});

  @override
  State<ConcertDetailScreen> createState() => _ConcertDetailScreenState();
}

class _ConcertDetailScreenState extends State<ConcertDetailScreen> {
  ConcertDetail concert = ConcertDetail(
      mt20id: 'PF132236',
      prfnm: '멤피스',
      poster: 'assets/images/poster_example5.jpeg',
      prfpdfrom: '2023.07.12',
      prfpdto: '2023.09.03',
      prfruntime: '165분',
      prfage: '14세 이상 관람가',
      genrenm: '뮤지컬',
      fcltynm: '예술의 전당 오페라 극장',
      styurls: 'assets/images/concert_example.jpg');
  @override
  Widget build(BuildContext context) {
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
                                  top: 90, left: 30, right: 30, bottom: 30),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${concert.prfnm}',
                                    style: TextStyle(fontSize: 30),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  CustomDetailText(
                                    type: '공연기간',
                                    content:
                                        '${concert.prfpdfrom} ~ ${concert.prfpdto}',
                                  ),
                                  CustomDetailText(
                                    type: '공연시간',
                                    content: '${concert.prfruntime}',
                                  ),
                                  CustomDetailText(
                                    type: '관람연령',
                                    content: '${concert.prfage}',
                                  ),
                                  CustomDetailText(
                                    type: '장르',
                                    content: '${concert.genrenm}',
                                  ),
                                  CustomDetailText(
                                    type: '공연장',
                                    content: '${concert.fcltynm}',
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                FacilityDetailScreen()), //페이지 이동시 공연장 이름 데이터 전달
                                      );
                                    },
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
                                        '상세 정보',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: 40),
                                        child:
                                            Image.asset('${concert.styurls}'),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(30, 65),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image.asset(
                              '${concert.poster}',
                              width: 170,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            CustomHeader(
              name: concert.prfnm,
              hasLiked: true,
              isDetail: true,
            ),
          ],
        ),
      ),
    );
  }
}
