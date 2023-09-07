import 'package:artroad/src/provider/condetail_provider.dart';
import 'package:artroad/widgets/custom_detail_text.dart';
import 'package:artroad/widgets/custom_concertdetail_header.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../facility/facilitydetail_screen.dart';
import 'package:auto_size_text/auto_size_text.dart';

class ConcertDetailScreen extends StatefulWidget {
  String concertID;
  String prfnm;

  ConcertDetailScreen(this.concertID, this.prfnm, {super.key});

  @override
  State<ConcertDetailScreen> createState() => _ConcertDetailScreenState();
}

class _ConcertDetailScreenState extends State<ConcertDetailScreen> {
  @override
  void initState() {
    super.initState();
    final concertDetailProvider =
        Provider.of<ConcertDetailProvider>(context, listen: false);
    concertDetailProvider.loadConcertDetails(widget.concertID);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF00233D),
        body: Stack(
          children: [
            Consumer<ConcertDetailProvider>(
              builder: (context, concertDetailProvider, child) {
                final concertDetailList = concertDetailProvider.concertDetails;

                if (concertDetailList.isEmpty) {
                  return const Center(child: CircularProgressIndicator());
                }
                int maxLength1 = 15;
                concertDetailList[0].fcltynm = concertDetailList[0]
                            .fcltynm
                            .toString()
                            .length <=
                        maxLength1
                    ? concertDetailList[0].fcltynm
                    : '${concertDetailList[0].fcltynm.toString().substring(0, maxLength1)}...';

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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        concertDetailList[0].prfnm.toString(),
                                        style: const TextStyle(fontSize: 30),
                                      ),
                                      const SizedBox(height: 30),
                                      CustomDetailText(
                                        type: '공연기간',
                                        content: (concertDetailList[0]
                                                        .prfpdfrom ==
                                                    null &&
                                                concertDetailList[0].prfpdto ==
                                                    null)
                                            ? '제공된 정보가 없습니다.'
                                            : '${concertDetailList[0].prfpdfrom ?? '정보 없음'} ~ ${concertDetailList[0].prfpdto ?? '정보 없음'}',
                                      ),
                                      CustomDetailText(
                                        type: '공연시간',
                                        content:
                                            concertDetailList[0].prfruntime ??
                                                '제공된 정보가 없습니다.',
                                      ),
                                      CustomDetailText(
                                        type: '관람연령',
                                        content: concertDetailList[0].prfage ??
                                            '제공된 정보가 없습니다.',
                                      ),
                                      CustomDetailText(
                                        type: '장르',
                                        content: concertDetailList[0].genrenm ??
                                            '제공된 정보가 없습니다.',
                                      ),
                                      CustomDetailText(
                                        type: '공연장',
                                        content: concertDetailList[0].fcltynm ??
                                            '제공된 정보가 없습니다.',
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  FacilityDetailScreen(
                                                      concertDetailList[0]
                                                              .mt10id ??
                                                          ''),
                                            ),
                                          );
                                        },
                                      ),
                                      const SizedBox(height: 20),
                                      const Divider(),
                                      const SizedBox(height: 20),
                                      Center(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            const AutoSizeText(
                                              '상세 이미지',
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 40, bottom: 90),
                                              child: (concertDetailList[0]
                                                          .styurls !=
                                                      null)
                                                  ? (concertDetailList[0]
                                                              .styurls
                                                          is List<dynamic>)
                                                      ? Column(
                                                          children: (concertDetailList[
                                                                          0]
                                                                      .styurls
                                                                  as List<
                                                                      dynamic>)
                                                              .whereType<String>() // 필요한 경우 String만 필터링
                                                              .map((url) {
                                                            return Image
                                                                .network(url);
                                                          }).toList(),
                                                        )
                                                      : Image.network(
                                                          concertDetailList[0]
                                                              .styurls)
                                                  : const AutoSizeText(
                                                      '제공된 정보가 없습니다.',
                                                      maxLines: 1,
                                                    ),
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
                              offset: const Offset(30, 65),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: (concertDetailList[0].poster != null)
                                    ? Image.network(
                                        '${concertDetailList[0].poster}',
                                        width: 170,
                                        fit: BoxFit.fill,
                                        errorBuilder:
                                            (context, error, stackTrace) {
                                          print('error: $error');
                                          return Container(
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
                                                AutoSizeText(
                                                  'No Image',
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.grey[600],
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                  maxLines: 1,
                                                ),
                                              ],
                                            ),
                                          );
                                        },
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
                                            AutoSizeText(
                                              'No Image',
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.grey[600],
                                                fontWeight: FontWeight.bold,
                                              ),
                                              maxLines: 1,
                                            ),
                                          ],
                                        ),
                                      ),
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
            CustomConcertDetailHeader(
              concertName: widget.prfnm,
              concertId: widget.concertID,
              hasLiked: true,
              isDetail: true,
            ),
          ],
        ),
      ),
    );
  }
}
