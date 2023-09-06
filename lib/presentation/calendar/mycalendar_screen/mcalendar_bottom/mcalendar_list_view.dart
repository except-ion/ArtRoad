import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'mcalendar_items.dart';
import 'mcalendar_items_tile.dart';

class mCalendarListView extends StatelessWidget {
  final List<mCalendarItems> mcalendarList = [
    mCalendarItems(null, 'Schedule Name 1', '2023.01.01', '링크있음', '없음', Colors.red),
    mCalendarItems(null, 'Schedule Name 2', '2023.02.01', null, '1일 전', Colors.orange),
    mCalendarItems(null, 'Schedule Name 3', '2023.03.01', '링크있음', '1주일 전', Colors.purple),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: mcalendarList.isEmpty ?
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10, left: 20),
                    child: Text(
                      '예정된 일정이 없습니다.',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF939191),
                      ),
                    ),
                  ),
                ],
              )
              :
              ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: const EdgeInsets.all(20),
                  itemCount: mcalendarList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(bottom: 15), // 원하는 여백 값
                      child: mCalendarItemsTile(mcalendarList[index]),
                    );
                  }
              ),
        ),
      ],
    );
  }
}