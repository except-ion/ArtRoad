import 'package:artroad/presentation/concert/concertdetail_screen.dart';
import 'package:flutter/material.dart';

import '../facility/facilitydetail_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        FacilityDetailScreen()), // 다른페이지이름에는 이동하고 싶은 페이지의 이름이 들어가야 합니다.
              );
            },
            child: Text(
              '공연장 상세',
            ),
          ),
          SizedBox(
            height: 20,
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        ConcertDetailScreen()), // 다른페이지이름에는 이동하고 싶은 페이지의 이름이 들어가야 합니다.
              );
            },
            child: Text(
              '공연 상세',
            ),
          ),
        ],
      )),
    );
  }
}
