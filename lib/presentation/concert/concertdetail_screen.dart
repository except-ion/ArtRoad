import 'package:artroad/src/provider/condetail_provider.dart';
import 'package:artroad/widgets/custom_detail_text.dart';
import 'package:artroad/widgets/custom_header.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../src/model/condetail.dart';
import '../facility/facilitydetail_screen.dart';

class ConcertDetailScreen extends StatefulWidget {
  String concertID;

  ConcertDetailScreen(
    this.concertID, {super.key}
    );

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
  void initState() {
    super.initState();
    final concertDetailProvider = Provider.of<ConcertDetailProvider>(context, listen: false);
    concertDetailProvider.loadConcertDetails(widget.concertID);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF00233D),
        body: Stack(
          children: [
            const CustomHeader(
              name: '공연 이름', // ConcertDetailProvider에서 가져온 공연 이름으로 대체
              hasLiked: true,
              isDetail: true,
            ),
            Consumer<ConcertDetailProvider>(
              builder: (context, concertDetailProvider, child) {
                final concertDetailList = concertDetailProvider.concertDetails;

                if (concertDetailList.isEmpty) {
                  return const Center(child: CircularProgressIndicator());
                }

                return Column(
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
                                  padding: const EdgeInsets.only(
                                    top: 90,
                                    left: 30,
                                    right: 30,
                                    bottom: 30,
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        concertDetailList[0].prfnm.toString(),
                                        style: const TextStyle(fontSize: 30),
                                      ),
                                      const SizedBox(height: 30),
                                      CustomDetailText(
                                        type: '공연기간',
                                        content: '${concertDetailList[0].prfpdfrom} ~ ${concertDetailList[0].prfpdto}',
                                      ),
                                      CustomDetailText(
                                        type: '공연시간',
                                        content: '${concertDetailList[0].prfruntime}',
                                      ),
                                      CustomDetailText(
                                        type: '관람연령',
                                        content: '${concertDetailList[0].prfage}',
                                      ),
                                      CustomDetailText(
                                        type: '장르',
                                        content: '${concertDetailList[0].genrenm}',
                                      ),
                                      CustomDetailText(
                                        type: '공연장',
                                        content: '${concertDetailList[0].fcltynm}',
                                        onPressed: () {
                                          // 눌렀을 때 처리할 내용 작성
                                        },
                                      ),
                                      const SizedBox(height: 20),
                                      const Divider(),
                                      const SizedBox(height: 20),
                                      const Column(
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
                                            // child: Image.network(
                                            //   'http://www.kopis.or.kr/${concertDetailList[0].styurls}',
                                            //   fit: BoxFit.cover,
                                            //   ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Transform.translate(
                              offset: const Offset(30, 65),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                // child: Image.network(
                                //   'http://www.kopis.or.kr/${concertDetailList[0].poster}',
                                //   width: 170,
                                //   fit: BoxFit.cover,
                                // ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
