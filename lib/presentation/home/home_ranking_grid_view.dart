import 'package:artroad/presentation/home/home_ranking_items.dart';
import 'package:flutter/material.dart';
import 'package:artroad/presentation/home/home_ranking_items_tile.dart';

class HomeRankingGridView extends StatelessWidget {
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
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: rankingList.length, //item 개수
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, //1 개의 행에 보여줄 item 개수
          childAspectRatio: 1 / 2, //item 의 가로 1, 세로 2 의 비율
          mainAxisSpacing: 10, //수평 Padding
          crossAxisSpacing: 10, //수직 Padding
        ),
        itemBuilder: (BuildContext context, int index) {
          //item 의 반목문 항목 형성
          return RankingItemsTile(rankingList[index]);
        },
      ),
    );
  }
}
