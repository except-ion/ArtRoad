import 'package:artroad/core/app_export.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:webview_flutter/webview_flutter.dart';
import '../../../widgets/custom_header.dart';
import '../../../widgets/custom_launch_url.dart';
import 'announce_items.dart';
import 'announce_items_tile.dart';
import 'package:flutter/gestures.dart';

class AnnounceListView extends StatelessWidget{
  final List<AnnounceItems> announceList = [
    AnnounceItems("개인정보 처리방침 (2023.09.06 기준)", content : SizedBox(
      height: 400,
      child: WebView(
        gestureRecognizers: {
          Factory<VerticalDragGestureRecognizer>(
                  () => VerticalDragGestureRecognizer()
          )
        },
        initialUrl: 'https://plip.kr/pcc/148da46f-f4e5-4e54-814a-d6c8b3f8568b/privacy-policy',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    ),),
    AnnounceItems("KOPIS API 명시사항", content : Padding(
      padding: getPadding(bottom: 20),
      child: Container(
        width: 360,
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  '본 정보는 공연 예매/취소 데이터를 전일 기준 집계하여 제공되며, \n'
                      '데이터 보정 등의 사유로 통계정보는 변동/지연될 수 있습니다.\n'
                      '최종 업데이트 ${DateFormat('yyyy.MM.dd').format(DateTime.now())}.',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                  maxLines: 4,
                ),
              ],
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  '제공',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                SizedBox(width: 2),
                InkWell(
                  onTap: () {
                    CustomLaunchUrl('https://kopis.or.kr/por/main/main.do');
                  },
                  child: Text(
                    'KOPIS 공연예술통합전산망',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    ),),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CustomHeader(
            name: '공지사항',
          ),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: announceList.length,
            itemBuilder: (context, index) {
              return AnnounceItemsTile(announceList[index]);
            },
            separatorBuilder: (context, index) {
              return const Divider();
            },
          ),
        ],
      ),
    );
  }
}