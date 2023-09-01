import 'package:artroad/presentation/calendar/favoritecalendar_screen/favoritecalendar_bottom/fcalendar_items_tile.dart';
import 'package:flutter/cupertino.dart';

import 'fcalendar_items.dart';

class fCalendarListView extends StatelessWidget {
  final List<fCalendarItems> fcalendarList = [
    fCalendarItems(null, 'Concert Name 1', 'facility Name 1', '2023.01.01', '2023.01.02'),
    fCalendarItems(null, 'Concert Name 2', 'facility Name 2', '2023.02.01', null),
    fCalendarItems(null, 'Concert Name 3', 'facility Name 3', '2023.03.01', '2023.03.02'),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
            child: ListView.builder(
              shrinkWrap: true,
                padding: const EdgeInsets.all(20),
                itemCount: fcalendarList.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(bottom: 15), // 원하는 여백 값
                    child: fCalendarItemsTile(fcalendarList[index]),
                  );
                }
            ),
        ),
      ],
    );
  }
}