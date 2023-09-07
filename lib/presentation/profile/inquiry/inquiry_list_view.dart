import 'package:artroad/core/app_export.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../widgets/custom_header.dart';
import 'inquiry_items.dart';
import 'inquiry_items_tile.dart';

class InquiryListView extends StatefulWidget {
  const InquiryListView({super.key});

  @override
  _InquiryListView createState() => _InquiryListView();
}

class _InquiryListView extends State<InquiryListView> {
  final List<InquiryItems> inquiryList = [
    InquiryItems("자주묻는 문의사항 테스트 1", content : ImageConstant.imgInquiryEx),
    InquiryItems("자주묻는 문의사항 테스트 2", content : ImageConstant.imgInquiryEx),
    InquiryItems("자주묻는 문의사항 테스트 3", content : ImageConstant.imgInquiryEx),
  ];

  // 고객센터 Dialog
  void _showCSDialog() {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
        ),
      ),
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter bottomState) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 20, left: 35, right: 35, bottom: 20),
                child: Container(
                  //키보드 창 크기만큼 컨텐츠 올리기
                  // padding: EdgeInsets.only(
                  //     bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Stack(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              // --- 구현부 ---
                              const Text(
                                '고객센터',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),

                              const SizedBox(height: 15),

                              const Text(
                                '평일 오전 10시 ~ 오후 6시 내 응답 가능\n주말 및 공휴일 휴무',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFF939191),
                                ),
                                textAlign: TextAlign.center,
                              ),

                              const SizedBox(height: 15),

                              const Divider(),

                              const SizedBox(height: 15),

                              InkWell(
                                onTap: () {
                                  // 텍스트 복사 로직 구현
                                  Clipboard.setData(const ClipboardData(text: 'kmu.sw.exception@gmail.com'));
                                  Fluttertoast.showToast(
                                    msg: '이메일 주소가 복사되었습니다.',
                                    toastLength: Toast.LENGTH_SHORT,
                                    backgroundColor: Colors.grey,
                                    textColor: Colors.white,
                                    fontSize: 16.0,
                                  );
                                },
                                child: Row(
                                  children: [
                                    const SizedBox(width: 0.7),

                                    CustomImageView(
                                      imagePath: ImageConstant.iconGmail,
                                      width: 24,
                                      height: 19,
                                    ),

                                    const SizedBox(width: 8.4),

                                    const Text(
                                      'kmu.sw.exception@gmail.com',
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              const SizedBox(height: 10),

                              InkWell(
                                  onTap: () {
                                    Fluttertoast.showToast(
                                      msg: '서비스 준비 중입니다.',
                                      toastLength: Toast.LENGTH_SHORT,
                                      backgroundColor: Colors.grey,
                                      textColor: Colors.white,
                                      fontSize: 16.0,
                                    );
                                  },
                                  child: Row(
                                    children: [
                                      CustomImageView(
                                        imagePath: ImageConstant.iconKakaoCh,
                                        width: 26,
                                        height: 26,
                                      ),

                                      const SizedBox(width: 7),

                                      const Text(
                                        '카카오톡 채널 - 익셉션',
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  )
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          Column(
            children: [
              const CustomHeader(
                name: '고객센터/ 자주 묻는 문의사항',
              ),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: inquiryList.length,
                itemBuilder: (context, index) {
                  return InquiryItemsTile(inquiryList[index]);
                },
                separatorBuilder: (context, index) {
                  return const Divider();
                },
              ),
            ],
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: getPadding(top: 21, right: 18),
              child: InkWell(
                onTap: () {
                  _showCSDialog();
                },
                child: Container(
                  width: 45,
                  height: 45,
                  decoration: const BoxDecoration(
                    color: Color(0xFF176FF2), // 배경색
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.headset_mic_rounded,
                      color: Colors.white,
                      size: 25,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}