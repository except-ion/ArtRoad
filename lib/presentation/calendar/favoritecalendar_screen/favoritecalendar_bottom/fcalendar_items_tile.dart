import 'package:artroad/presentation/calendar/favoritecalendar_screen/favoritecalendar_bottom/fcalendar_items.dart';
import 'package:artroad/presentation/concert/concertdetail_screen.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/image_constant.dart';

class fCalendarItemsTile extends StatelessWidget {
  const fCalendarItemsTile(this._fCalendarItems, {super.key});

  final fCalendarItems _fCalendarItems;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: 0,
          top: 1,
          child: Image.asset(
            ImageConstant.imageVerticalLine,
            color: const Color(0xFF176FF2),
          ),
        ),

        const SizedBox(width: 10),

        ListTile(
          title: Text(
            '${_fCalendarItems.prfnm}',
            style: const TextStyle(
              color: Color(0xFF176FF2),
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),

          subtitle: Column(
            children: [
              const SizedBox(height: 3.5),

              Row(
                children: [
                  if (_fCalendarItems.prfpd == null)
                    const Text(
                      '날짜 없음',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF939191),
                      ),
                    ),
                  if (_fCalendarItems.prfpd != null)
                    Text(
                      '${_fCalendarItems.prfpd}',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Color(0xFF939191),
                      ),
                    ),
                ],
              ),

              const SizedBox(height: 3),

              Row(
                children: [
                  const Icon(
                    Icons.location_on_sharp,
                    color: Color(0xFF939191),
                    size: 18,
                  ),

                  const SizedBox(width: 2.5),

                  InkWell(
                    onTap: () {
                      print('Move to facility detail page');
                    },
                    child: Text(
                      '${_fCalendarItems.fcltynm}',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Color(0xFF939191),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
          trailing: InkWell(
            onTap: () {
              String concertID = _fCalendarItems.mt20id ?? '';
              String prfnm = _fCalendarItems.prfnm ?? '';
              String prfpd = _fCalendarItems.prfpd ?? '';

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ConcertDetailScreen(
                    concertID, 
                    prfnm, 
                    prfpd
                  ),
                ),
              );
            },
            child: const Icon(
              Icons.keyboard_arrow_right_rounded,
              color: Color(0xFF939191),
              size: 30,
            ),
          ),
        )
      ],
    );
  }

}