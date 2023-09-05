import 'package:artroad/src/repository/ranking_repo.dart';
import 'package:flutter/material.dart';
import 'package:artroad/presentation/home/home_ranking_items.dart';

class RankingProvider extends ChangeNotifier {
  // EvRepository를 접근(데이터를 받아와야 하기 때문에)
  final RankingRepository _rankingRepository = RankingRepository();

  List<RankingItems> _top10rankings = [];
  List<RankingItems> get top10rankings => _top10rankings;

  List<RankingItems> _playRankings = [];
  List<RankingItems> get playRankings => _playRankings;

  List<RankingItems> _musicalRankings = [];
  List<RankingItems> get musicalRankings => _musicalRankings;

  List<RankingItems> _classicRankings = [];
  List<RankingItems> get classicRankings => _classicRankings;

  List<RankingItems> _koreanRankings = [];
  List<RankingItems> get koreanRankings => _koreanRankings;

  List<RankingItems> _popularRankings = [];
  List<RankingItems> get popularRankings => _popularRankings;

  List<RankingItems> _danceRankings = [];
  List<RankingItems> get danceRankings => _danceRankings;

  List<RankingItems> _popularDanceRankings = [];
  List<RankingItems> get popularDanceRankings => _popularDanceRankings;

  List<RankingItems> _circusRankings = [];
  List<RankingItems> get circusRankings => _circusRankings;

  List<RankingItems> _complexRankings = [];
  List<RankingItems> get complexRankings => _complexRankings;

  List<RankingItems> _kidRankings = [];
  List<RankingItems> get kidRankings => _kidRankings;

  // 데이터 로드
  loadTop10Rankings() async {
    List<RankingItems>? listRankings = await _rankingRepository.loadTop10Rankings();
    _top10rankings = listRankings!;
    notifyListeners(); // 데이터가 업데이트가 됐으면 구독자에게 알린다.
  }

  loadPlayRankings() async {
    List<RankingItems>? listPlayRankings = await _rankingRepository.loadPlayRankings('AAAA');
    _playRankings = listPlayRankings!;
    notifyListeners();
  }

  loadMusicalRankings() async {
    List<RankingItems>? listMusicalRankings = await _rankingRepository.loadMusicalRankings('GGGA');
    _musicalRankings = listMusicalRankings!;
    notifyListeners();
  }

  loadClassicRankings() async {
    List<RankingItems>? listClassicRankings = await _rankingRepository.loadClassicRankings('CCCA');
    _classicRankings = listClassicRankings!;
    notifyListeners();
  }

  loadKoreanRankings() async {
    List<RankingItems>? listKoreanRankings = await _rankingRepository.loadKoreanRankings('CCCC');
    _koreanRankings = listKoreanRankings!;
    notifyListeners();
  }

  loadPopularRankings() async {
    List<RankingItems>? listPopularyRankings = await _rankingRepository.loadPopularRankings('CCCD');
    _popularRankings = listPopularyRankings!;
    notifyListeners();
  }

  loadDanceRankings() async {
    List<RankingItems>? listDanceRankings = await _rankingRepository.loadDanceRankings('BBBC');
    _danceRankings = listDanceRankings!;
    notifyListeners();
  }

  loadPopularDanceRankings() async {
    List<RankingItems>? listPopularDanceRankings = await _rankingRepository.loadPopularDanceRankings('BBBR');
    _popularDanceRankings = listPopularDanceRankings!;
    print('_popularDanceRankings: $_popularDanceRankings');
    notifyListeners();
  }

  loadCircusRankings() async {
    List<RankingItems>? listCircusRankings = await _rankingRepository.loadCircusRankings('EEEB');
    _circusRankings = listCircusRankings!;
    notifyListeners();
  }

  loadComplexRankings() async {
    List<RankingItems>? listComplexRankings = await _rankingRepository.loadComplexRankings('EEEA');
    _complexRankings = listComplexRankings!;
    notifyListeners();
  }

  loadKidRankings() async {
    List<RankingItems>? listKidRankings = await _rankingRepository.loadKidRankings('KID');
    _kidRankings = listKidRankings!;
    notifyListeners();
  }
}