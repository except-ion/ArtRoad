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
      poster: 'null',
      prfpdfrom: null,
      prfpdto: '2023.09.03',
      prfruntime: '165분',
      prfage: null,
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
                                  top: 90, left: 30, right: 30, bottom: 50),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    concert.prfnm ?? '제공된 정보가 없습니다.',
                                    style: TextStyle(fontSize: 30),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  CustomDetailText(
                                    type: '공연기간',
                                    content: (concert.prfpdfrom == null &&
                                            concert.prfpdto == null)
                                        ? '제공된 정보가 없습니다.'
                                        : '${concert.prfpdfrom ?? '정보 없음'} ~ ${concert.prfpdto ?? '정보 없음'}',
                                  ),
                                  CustomDetailText(
                                    type: '공연시간',
                                    content:
                                        concert.prfruntime ?? '제공된 정보가 없습니다.',
                                  ),
                                  CustomDetailText(
                                    type: '관람연령',
                                    content: concert.prfage ?? '제공된 정보가 없습니다.',
                                  ),
                                  CustomDetailText(
                                    type: '장르',
                                    content: concert.genrenm ?? '제공된 정보가 없습니다.',
                                  ),
                                  CustomDetailText(
                                    type: '공연장',
                                    content: concert.fcltynm ?? '제공된 정보가 없습니다.',
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
                                  Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
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
                                          padding: EdgeInsets.only(top: 40,bottom: 40),
                                          child: concert.styurls == null
                                              ? Image.asset(
                                                  '${concert.styurls}')
                                              : Text('제공된 정보가 없습니다.'),
                                        )
                                      ],
                                    ),
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
                            child: (concert.poster == null)
                                ? Image.asset(
                                    '${concert.poster}',
                                    width: 170,
                                  )
                                : Container(
                                    color: Colors.grey[100],
                                    width: 170,
                                    height: 240,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.no_photography_outlined,
                                          size: 50,
                                          color: Colors.grey[600],
                                        ),
                                        Text(
                                          'No Image',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.grey[600],
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
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
