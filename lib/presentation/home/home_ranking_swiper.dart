import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:artroad/presentation/home/home_ranking_items_tile.dart';
import 'package:card_swiper/card_swiper.dart';
import '../../src/model/ranking.dart';

class HomeRankingSwiper extends StatelessWidget {
  final List<Ranking> rankingList;

  const HomeRankingSwiper({super.key, required this.rankingList});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300, // 스와이퍼의 높이 설정해야함
      child: Swiper(
        onTap: (index) => {}, //사진 클릭시 이동
        autoplay: true,
        scale: 0.8,
        viewportFraction: 0.6,
        itemCount: rankingList.length,
        itemBuilder: (BuildContext context, int index) {
          return Stack(children: [
            RankingTile(
              rankingList[index],
            ),
            Transform.translate(
              offset: const Offset(10, 175),
              child: AutoSizeText(
                '${rankingList[index].rnum}',
                maxFontSize: 110,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 110,
                    fontWeight: FontWeight.w600,
                    letterSpacing: -13,
                    shadows: [
                      Shadow(
                          // bottomLeft
                          offset: Offset(-1.5, -1.5),
                          color: Colors.black),
                      Shadow(
                          // bottomRight
                          offset: Offset(1.5, -1.5),
                          color: Colors.black),
                      Shadow(
                          // topRight
                          offset: Offset(1.5, 1.5),
                          color: Colors.black),
                      Shadow(
                          // topLeft
                          offset: Offset(-1.5, 1.5),
                          color: Colors.black),
                    ]),
              ),
            ),
          ]);
        },
      ),
    );
  }
}
