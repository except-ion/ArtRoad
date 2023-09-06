import 'package:artroad/widgets/custom_header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../src/model/condetail.dart';
import 'favorite_items_tile.dart';

class FavoriteScreen extends StatefulWidget {
  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  final List<ConcertDetail> concertList = [
    ConcertDetail(
        mt20id: 'PF132236',
        prfnm: '멤',
        poster: null,
        prfpdfrom: '2023.07.12',
        prfpdto: '2023.09.03',
        prfruntime: '165분',
        prfage: '14세 이상 관람가',
        genrenm: '뮤지컬',
        fcltynm: null,
        styurls: 'assets/images/concert_example.jpg'),
    ConcertDetail(
        mt20id: 'PF132236',
        prfnm: '멤피스 1',
        poster: 'assets/images/poster_example5.jpeg',
        prfpdfrom: '2023.07.12',
        prfpdto: '2023.09.03',
        prfruntime: '165분',
        prfage: '14세 이상 관람가',
        genrenm: '뮤지컬',
        fcltynm: '예술의 전당 오페라 극장',
        styurls: 'assets/images/concert_example.jpg'),
    ConcertDetail(
        mt20id: 'PF132236',
        prfnm: '멤피스 2',
        poster: 'assets/images/poster_example5.jpeg',
        prfpdfrom: '2023.07.12',
        prfpdto: '2023.09.03',
        prfruntime: '165분',
        prfage: '14세 이상 관람가',
        genrenm: '뮤지컬',
        fcltynm: '예술의 전당 오페라 극장',
        styurls: 'assets/images/concert_example.jpg'),
    ConcertDetail(
        mt20id: 'PF132236',
        prfnm: '멤피스 3',
        poster: 'assets/images/poster_example5.jpeg',
        prfpdfrom: '2023.07.12',
        prfpdto: '2023.09.03',
        prfruntime: '165분',
        prfage: '14세 이상 관람가',
        genrenm: '뮤지컬',
        fcltynm: '예술의 전당 오페라 극장',
        styurls: 'assets/images/concert_example.jpg'),

  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CustomHeader(
            name: '관심공연 목록',
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: concertList.length,
            itemBuilder: (context, index) {
              return FavoriteItemsTile(concertList[index]);
            },
          )
        ],
      ),
    );
  }
}