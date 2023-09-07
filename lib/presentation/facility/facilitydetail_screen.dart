import 'package:artroad/src/provider/facdetail_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kakaomap_webview/kakaomap_webview.dart';
import 'package:provider/provider.dart';
import '../../widgets/custom_header.dart';
import '../../widgets/custom_launch_url.dart';
import 'facilitydetail_accommodation/accommodation_list_view.dart';
import 'facilitydetail_restaurant/restaurant_list_view.dart';
import 'package:auto_size_text/auto_size_text.dart';

class FacilityDetailScreen extends StatefulWidget {
  String facilityID;

  FacilityDetailScreen(this.facilityID, {Key? key}) : super(key: key);

  @override
  _FacilityDetailScreenState createState() => _FacilityDetailScreenState();
}

class _FacilityDetailScreenState extends State<FacilityDetailScreen> {
  String kakaoMapKey = dotenv.env['KAKAO_MAP_KEY']!;
  bool isRestaurantSelected = true;
  bool isAccommodationSelected = false;

  @override
  void initState() {
    super.initState();
    final facilityDetailProvider =
        Provider.of<FacilityDetailProvider>(context, listen: false);
    facilityDetailProvider.loadFacilityDetails(widget.facilityID);
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF00233D),
        body: Stack(
          children: [
            Consumer<FacilityDetailProvider>(
              builder: (context, facilityDetailProvider, child) {
                final facilityDetailList =
                    facilityDetailProvider.facilityDetails;

                if (facilityDetailList.isEmpty) {
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
                                    top: 20,
                                    left: 30,
                                    right: 30,
                                    bottom: 30,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Visibility(
                                        visible: facilityDetailList[0].la != null && facilityDetailList[0].lo != null,
                                        child: SizedBox(
                                          height: 200,
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(16),
                                            child: KakaoMapView(
                                              width: double.infinity,
                                              height: 200,
                                              kakaoMapKey: kakaoMapKey,
                                              lat: double.parse(facilityDetailList[0].la  ?? '0.0'),
                                              lng: double.parse(facilityDetailList[0].lo ?? '0.0'),
                                              showMapTypeControl: true,
                                              showZoomControl: true,
                                              markerImageURL: 'https://img.icons8.com/glyph-neue/64/176ffe/region-code.png',
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 20),
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.location_on_sharp,
                                            color: Color(0xFF939191),
                                            size: 20,
                                          ),
                                          const SizedBox(width: 5),
                                          (facilityDetailList[0].adres == null)
                                              ? const Text(
                                                  "주소 정보 없음",
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    color: Color(0xFF939191),
                                                  ),
                                                )
                                              : AutoSizeText(
                                                  facilityDetailList[0]
                                                      .adres
                                                      .toString(),
                                                  style: const TextStyle(
                                                    fontSize: 16,
                                                    color: Color(0xFF939191),
                                                  ),
                                                  maxLines: 1,
                                                ),
                                          const SizedBox(width: 5),
                                          InkWell(
                                            onTap: () {
                                              // 텍스트 복사 로직 구현
                                              Clipboard.setData(
                                                  const ClipboardData(
                                                      text: '공연장 이름 복사'));
                                              Fluttertoast.showToast(
                                                msg: '주소가 복사되었습니다.',
                                                toastLength: Toast.LENGTH_SHORT,
                                                backgroundColor: Colors.grey,
                                                textColor: Colors.white,
                                                fontSize: 16.0,
                                              );
                                              print('adress copy bt');
                                            },
                                            child: const Icon(
                                              Icons.copy_rounded,
                                              color: Color(0xFF176FF2),
                                              size: 20,
                                            ),
                                          )
                                        ],
                                      ),
                                      const SizedBox(height: 7),
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.call,
                                            color: Color(0xFF939191),
                                            size: 20,
                                          ),
                                          const SizedBox(width: 5),
                                          (facilityDetailList[0].telno == null)
                                              ? const AutoSizeText(
                                                  "전화번호 정보 없음",
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    color: Color(0xFF939191),
                                                  ),
                                                )
                                              : AutoSizeText(
                                                  facilityDetailList[0]
                                                      .telno
                                                      .toString(),
                                                  style: const TextStyle(
                                                    fontSize: 16,
                                                    color: Color(0xFF939191),
                                                  ),
                                                  maxLines: 1,
                                                ),
                                          const SizedBox(width: 5),
                                          InkWell(
                                            onTap: () {
                                              Clipboard.setData(ClipboardData(
                                                  text: facilityDetailList[0]
                                                      .telno
                                                      .toString()));
                                              Fluttertoast.showToast(
                                                msg: '전화번호가 복사되었습니다.',
                                                toastLength: Toast.LENGTH_SHORT,
                                                backgroundColor: Colors.grey,
                                                textColor: Colors.white,
                                                fontSize: 16.0,
                                              );
                                            },
                                            child: const Icon(
                                              Icons.copy_rounded,
                                              color: Color(0xFF176FF2),
                                              size: 20,
                                            ),
                                          )
                                        ],
                                      ),
                                      const SizedBox(height: 7),
                                      InkWell(
                                        onTap: () async {
                                          if (facilityDetailList[0].relateurl !=
                                              null) {
                                            await CustomLaunchUrl(
                                                '${facilityDetailList[0].relateurl}');
                                          }
                                        },
                                        child: Row(
                                          children: [
                                            const Icon(
                                              Icons.link_rounded,
                                              color: Color(0xFF939191),
                                              size: 20,
                                            ),
                                            const SizedBox(width: 5),
                                            (facilityDetailList[0].relateurl ==
                                                    null)
                                                ? const AutoSizeText(
                                                    '사이트 링크 없음',
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      color: Color(0xFF939191),
                                                    ),
                                                  )
                                                : Flexible(
                                                    child: AutoSizeText(
                                                      '${facilityDetailList[0].relateurl}',
                                                      style: const TextStyle(
                                                        fontSize: 16,
                                                        color:
                                                            Color(0xFF939191),
                                                      ),
                                                      maxLines:
                                                          2, // 텍스트가 최대 2줄로 표시되도록 설정 (원하는 줄 수로 조정 가능)
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      const Divider(),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.min,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    isRestaurantSelected = true;
                                                    isAccommodationSelected =
                                                        false;
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
                                                      const EdgeInsets.only(
                                                          bottom: 11),
                                                  decoration: BoxDecoration(
                                                    border: isRestaurantSelected
                                                        ? const Border(
                                                            bottom: BorderSide(
                                                                width: 3.5,
                                                                color: Colors
                                                                    .black))
                                                        : const Border(
                                                            bottom: BorderSide(
                                                                width: 1.5,
                                                                color: Color(
                                                                    0xFFC7C7CC))),
                                                  ),
                                                  child: AutoSizeText(
                                                    '음식점',
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          isRestaurantSelected
                                                              ? FontWeight.bold
                                                              : FontWeight
                                                                  .normal,
                                                      color:
                                                          isRestaurantSelected
                                                              ? Colors.black
                                                              : const Color(
                                                                  0xFF939191),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  setState(() {
                                                    isRestaurantSelected =
                                                        false;
                                                    isAccommodationSelected =
                                                        true;
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
                                                      const EdgeInsets.only(
                                                          bottom: 11),
                                                  decoration: BoxDecoration(
                                                    border: isAccommodationSelected
                                                        ? const Border(
                                                            bottom: BorderSide(
                                                                width: 3.5,
                                                                color: Colors
                                                                    .black))
                                                        : const Border(
                                                            bottom: BorderSide(
                                                                width: 1.5,
                                                                color: Color(
                                                                    0xFFC7C7CC))),
                                                  ),
                                                  child: AutoSizeText(
                                                    '숙소',
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          isAccommodationSelected
                                                              ? FontWeight.bold
                                                              : FontWeight
                                                                  .normal,
                                                      color:
                                                          isAccommodationSelected
                                                              ? Colors.black
                                                              : const Color(
                                                                  0xFF939191),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          if (isRestaurantSelected)
                                            RestaurantListView(
                                                facilityDetailList[0].la,
                                                facilityDetailList[0].lo),
                                          if (isAccommodationSelected)
                                            AccommodationListView(
                                                facilityDetailList[0].la,
                                                facilityDetailList[0].lo),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Transform.translate(
                              offset: const Offset(30, 180),
                              child: (facilityDetailList[0].fcltynm == null)
                                  ? const AutoSizeText(
                                      '공연장 이름 없음',
                                      style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
                                      ),
                                    )
                                  : AutoSizeText(
                                      facilityDetailList[0].fcltynm.toString(),
                                      style: const TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
                                      ),
                                      maxLines: 1,
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
            const CustomHeader(
              isDetail: true,
            )
          ],
        ),
      ),
    );
  }
}
