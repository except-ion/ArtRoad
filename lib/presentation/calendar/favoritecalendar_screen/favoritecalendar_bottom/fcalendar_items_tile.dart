import 'package:artroad/src/model/fcalendar_items.dart';
import 'package:artroad/presentation/concert/concertdetail_screen.dart';
import 'package:artroad/presentation/facility/facilitydetail_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
            '${_fCalendarItems.prfnm}'.toString().length <= 25
                ? '${_fCalendarItems.prfnm}'.toString()
                : '${'${_fCalendarItems.prfnm}'.toString().substring(0, 25)}...',
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
                  Text(
                    DateFormat('yyyy.MM.dd').format( _fCalendarItems.prfpdfrom),
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFF939191),
                    ),
                  ),
                  Text(
                    ' ~ ${DateFormat('yyyy.MM.dd').format(_fCalendarItems.prfpdto)}',
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
                      String facilityID = _fCalendarItems.mt10id ?? '';
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FacilityDetailScreen(facilityID),
                        ),
                      );
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

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ConcertDetailScreen(
                    concertID, 
                    prfnm, 
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