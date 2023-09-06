import 'package:artroad/presentation/home/home_ranking_swiper.dart';
import 'package:artroad/src/model/ranking.dart';
import 'package:artroad/src/provider/ranking_provider.dart';
import 'package:flutter/material.dart';
import 'package:artroad/theme/theme_helper.dart';
import 'package:provider/provider.dart';
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

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

int _selectedCategoryIndex = 0;

class _HomeScreenState extends State<HomeScreen> {
  final List<String> cateList = [
    '연극',
    '뮤지컬',
    '클래식',
    '국악',
    '대중음악',
    '무용',
    '서커스/마술',
    '복합',
    '아동',
  ];

  List<Ranking> getSelectedCategoryRankings(
      int index, RankingProvider provider) {
    switch (index) {
      case 0:
        return provider.playRankings;
      case 1:
        return provider.musicalRankings;
      case 2:
        return provider.classicRankings;
      case 3:
        return provider.koreanRankings;
      case 4:
        return provider.popularRankings;
      case 5:
        return provider.danceRankings;
      case 6:
        return provider.circusRankings;
      case 7:
        return provider.complexRankings;
      case 8:
        return provider.kidRankings;

      default:
        return [];
    }
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      final rankingProvider = Provider.of<RankingProvider>(context);
      rankingProvider.loadTop10Rankings();
      rankingProvider.loadPlayRankings();
      rankingProvider.loadMusicalRankings();
      rankingProvider.loadClassicRankings();
      rankingProvider.loadKoreanRankings();
      rankingProvider.loadPopularRankings();
      rankingProvider.loadDanceRankings();
      rankingProvider.loadCircusRankings();
      rankingProvider.loadComplexRankings();
      rankingProvider.loadKidRankings();
    });
  }

  @override
  Widget build(BuildContext context) {
    final rankingProvider = Provider.of<RankingProvider>(context);
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Padding(
            padding: const EdgeInsets.all(30),
            child: Align(
              alignment: Alignment.topLeft,
              child: ShaderMask(
                shaderCallback: (Rect bounds) {
                  return const LinearGradient(
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
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Top 10',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          HomeRankingSwiper(rankingList: rankingProvider.top10rankings),
          const SizedBox(
            height: 10,
          ),
          const Text(
            '분야별 랭킹',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w600,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Wrap(
              alignment: WrapAlignment.center,
              spacing: 8.0,
              children: _buildCategoryChips(),
            ),
          ),
          //index별로 다른 list 보내도록 설정
          HomeRankingGridView(
              selectedCategoryIndex: _selectedCategoryIndex,
              rankingList: getSelectedCategoryRankings(
                  _selectedCategoryIndex, rankingProvider))
        ]),
      ),
    );
  }

  List<Widget> _buildCategoryChips() {
    return List<Widget>.generate(
      cateList.length,
      (index) => ChoiceChip(
        selectedColor: const Color(0xFF176FF2),
        selectedShadowColor: Colors.white,
        backgroundColor: _selectedCategoryIndex == index
            ? const Color(0xFF176FF2) // 선택된 경우 파란색 배경색
            : Colors.white, // 선택되지 않은 경우 투명 배경색
        shape: RoundedRectangleBorder(
          side: BorderSide(
              color: _selectedCategoryIndex == index
                  ? Colors.transparent // 선택된 경우 테두리 없음
                  : const Color(0xFFC7C7CC), // 선택되지 않은 경우 기본 테마 테두리 색
              width: 0.5),
          borderRadius: BorderRadius.circular(30),
        ),
        label: Text(
          cateList[index],
          style: TextStyle(
            color: _selectedCategoryIndex == index
                ? Colors.white // 선택된 경우 흰색 글자색
                : Theme.of(context).primaryColor, // 선택되지 않은 경우 기본 테마 글자색
          ),
        ),
        selected: _selectedCategoryIndex == index,
        onSelected: (selected) {
          setState(() {
            _selectedCategoryIndex = selected ? index : 0;
          });
        },
      ),
    ).toList();
  }
}
