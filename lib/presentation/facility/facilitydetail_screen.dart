import 'package:artroad/src/provider/facdetail_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../../widgets/custom_header.dart';
import 'facilitydetail_accommodation/accommodation_list_view.dart';
import 'facilitydetail_info_icons.dart';
import 'facilitydetail_restaurant/restaurant_list_view.dart';

class FacilityDetailScreen extends StatefulWidget {
  String facilityID;

  FacilityDetailScreen(
    this.facilityID, 
    {Key? key}
    ) : super(key: key);

  @override
  _FacilityDetailScreenState createState() => _FacilityDetailScreenState();
}

class _FacilityDetailScreenState extends State<FacilityDetailScreen> {
  bool isRestaurantSelected = true;
  bool isAccommodationSelected = false;

  @override
  void initState() {
    super.initState();
    final facilityDetailProvider = Provider.of<FacilityDetailProvider>(context, listen: false);
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
                final facilityDetailList = facilityDetailProvider.facilityDetails;

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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.location_on_sharp,
                                        color: Color(0xFF939191),
                                        size: 20,
                                      ),
                                      const SizedBox(width: 5),
                                      Text(
                                        facilityDetailList[0].fcltynm.toString(),
                                        style: const TextStyle(
                                          fontSize: 16,
                                          color: Color(0xFF939191),
                                        ),
                                      ),
                                      const SizedBox(width: 5),
                                      InkWell(
                                        onTap: () {
                                          // 텍스트 복사 로직 구현
                                          Clipboard.setData(const ClipboardData(text: '공연장 이름 복사'));
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
                                      ),
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
                                      Text(
                                        facilityDetailList[0].telno.toString(),
                                        style: const TextStyle(
                                          fontSize: 16,
                                          color: Color(0xFF939191),
                                        ),
                                      ),
                                      const SizedBox(width: 5),
                                      InkWell(
                                        onTap: () {
                                          // 텍스트 복사 로직 구현
                                          Clipboard.setData(const ClipboardData(text: '1668-1352'));
                                          Fluttertoast.showToast(
                                            msg: '전화번호가 복사되었습니다.',
                                            toastLength: Toast.LENGTH_SHORT,
                                            backgroundColor: Colors.grey,
                                            textColor: Colors.white,
                                            fontSize: 16.0,
                                          );
                                          print('phone number copy bt');
                                        },
                                        child: const Icon(
                                          Icons.copy_rounded,
                                          color: Color(0xFF176FF2),
                                          size: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 7),
                                  Row(
                                    children: [
                                      const Icon(
                                        Icons.link_rounded,
                                        color: Color(0xFF939191),
                                        size: 20,
                                      ),
                                      const SizedBox(width: 5),
                                      Text(
                                        facilityDetailList[0].relateurl.toString(),
                                        style: const TextStyle(
                                          fontSize: 16,
                                          color: Color(0xFF939191),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  const Divider(),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text(
                                        '공연장 시설 정보',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                        ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(
                                          top: 20,
                                          bottom: 20,
                                        ),
                                        child: FacilityDetailInfoIcons(),
                                      ),
                                      const Divider(),
                                      const SizedBox(
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
                                                  const EdgeInsets.only(bottom: 11),
                                              decoration: BoxDecoration(
                                                border: isRestaurantSelected
                                                    ? const Border(
                                                        bottom: BorderSide(
                                                            width: 3.5,
                                                            color:
                                                                Colors.black))
                                                    : const Border(
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
                                                      : const Color(0xFF939191),
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
                                                  const EdgeInsets.only(bottom: 11),
                                              decoration: BoxDecoration(
                                                border: isAccommodationSelected
                                                    ? const Border(
                                                        bottom: BorderSide(
                                                            width: 3.5,
                                                            color:
                                                                Colors.black))
                                                    : const Border(
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
                                                      : const Color(0xFF939191),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      if (isRestaurantSelected)
                                        const RestaurantListView(),
                                      if (isAccommodationSelected)
                                        const AccommodationListView(),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Transform.translate(
                          offset: const Offset(30, 180),
                          child: Text(
                            facilityDetailList[0].fcltynm.toString(),
                            style: const TextStyle(
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
