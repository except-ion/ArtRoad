import 'package:artroad/presentation/home/home_ranking_items.dart';
import 'package:flutter/material.dart';
import 'package:artroad/presentation/home/home_ranking_items_tile.dart';

class HomeRankingGridView extends StatelessWidget {
  final int selectedCategoryIndex; // 선택된 칩의 인덱스를 받을 변수
  final List<RankingItems> rankingList;

  const HomeRankingGridView({
    Key? key, 
    required this.selectedCategoryIndex,
    required this.rankingList,
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: SizedBox(
        height: 540,
        child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: rankingList.length, //item 개수
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, //1 개의 행에 보여줄 item 개수
            childAspectRatio: 3 / 4, //item 의 가로 1, 세로 2 의 비율
            mainAxisSpacing: 5, //수평 Padding
            crossAxisSpacing: 5, //수직 Padding
          ),
          itemBuilder: (BuildContext context, int index) {
            //item 의 반목문 항목 형성
            return Padding(
                padding: const EdgeInsets.all(5),
                child: RankingItemsTile(rankingList[index]));
          },
        ),
      ),
    );
  }
}
