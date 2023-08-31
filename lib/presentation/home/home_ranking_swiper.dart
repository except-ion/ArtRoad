import 'package:artroad/presentation/home/home_ranking_items.dart';
import 'package:flutter/material.dart';
import 'package:artroad/presentation/home/home_ranking_items_tile.dart';
import 'package:card_swiper/card_swiper.dart';

class HomeRankingSwiper extends StatelessWidget {
  final List<RankingItems> rankingList = [
    RankingItems(
        mt20id: "aaa",
        cate: "연극",
        poster:
            "https://www.kopis.or.kr/upload/pfmPoster/PF_PF131793_160603_140415.jpg",
        rnum: "1"),
    RankingItems(
        mt20id: "aaa",
        cate: "연극",
        poster:
            "https://www.kopis.or.kr/upload/pfmPoster/PF_PF131793_160603_140415.jpg",
        rnum: "2"),
    RankingItems(
        mt20id: "aaa",
        cate: "연극",
        poster:
            "https://www.kopis.or.kr/upload/pfmPoster/PF_PF131793_160603_140415.jpg",
        rnum: "3"),
    RankingItems(
        mt20id: "aaa",
        cate: "연극",
        poster:
            "https://www.kopis.or.kr/upload/pfmPoster/PF_PF131793_160603_140415.jpg",
        rnum: "4"),
    RankingItems(
        mt20id: "aaa",
        cate: "연극",
        poster:
            "https://www.kopis.or.kr/upload/pfmPoster/PF_PF131793_160603_140415.jpg",
        rnum: "5"),
    RankingItems(
        mt20id: "aaa",
        cate: "연극",
        poster:
            "https://www.kopis.or.kr/upload/pfmPoster/PF_PF131793_160603_140415.jpg",
        rnum: "6"),
    RankingItems(
        mt20id: "aaa",
        cate: "연극",
        poster:
            "https://www.kopis.or.kr/upload/pfmPoster/PF_PF131793_160603_140415.jpg",
        rnum: "7"),
    RankingItems(
        mt20id: "aaa",
        cate: "연극",
        poster:
            "https://www.kopis.or.kr/upload/pfmPoster/PF_PF131793_160603_140415.jpg",
        rnum: "8"),
    RankingItems(
        mt20id: "aaa",
        cate: "연극",
        poster:
            "https://www.kopis.or.kr/upload/pfmPoster/PF_PF131793_160603_140415.jpg",
        rnum: "9"),
  ];

  @override
  Widget build(BuildContext context) {
    print(rankingList.elementAt(0).rnum);
    return Container(
            height: 300, // 스와이퍼의 높이 설정해야함
            child: Swiper(
              onTap: (index) => {}, //사진 클릭시 이동
              autoplay: true,
              scale: 0.8,
              viewportFraction: 0.6,
              itemCount: rankingList.length,
              itemBuilder: (BuildContext context, int index) {
                return RankingItemsTile(rankingList[index]);
              },
            ),
          );
  }
}
