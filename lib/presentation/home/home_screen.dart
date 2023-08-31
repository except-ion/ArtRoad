import 'package:artroad/presentation/home/home_ranking_swiper.dart';
import 'package:flutter/material.dart';
import 'package:artroad/theme/theme_helper.dart';
import 'home_ranking_grid_view.dart';

final List<String> imgList = [
  'assets/images/login_background_image_1.png',
  'assets/images/login_background_image_2.png',
  'assets/images/login_background_image_3.png',
  'assets/images/login_background_image_4.png',
  'assets/images/login_background_image_5.png',
  'assets/images/login_background_image_6.png',
  'assets/images/login_background_image_7.png',
  'assets/images/login_background_image_8.png',
  'assets/images/login_background_image_9.png',
  'assets/images/login_background_image_10.png',
];

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Padding(
            padding: EdgeInsets.all(30),
            child: Align(
              alignment: Alignment.topLeft,
              child: ShaderMask(
                shaderCallback: (Rect bounds) {
                  return LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [Colors.transparent, Colors.white], // 그라데이션 색상 설정
                    stops: [0.0, 1.0], // 그라데이션 위치 설정
                  ).createShader(bounds);
                },
                child: Text(
                  "ArtRoad",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: theme.textTheme.displaySmall?.copyWith(
                    fontSize: 30.0, // 폰트 사이즈 조절
                    fontWeight: FontWeight.normal, // 폰트 굵기 조절
                    color:
                        Colors.grey, // 텍스트 색상 설정 (그라데이션에 의해 가려지므로 원하는 색상 사용 가능)
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Top 10',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          HomeRankingSwiper(),
          SizedBox(height: 40,),
          HomeRankingGridView(),
        ]),
      ),
    );
  }
}
