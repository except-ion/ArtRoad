import 'package:artroad/src/model/ranking.dart';
import 'package:artroad/src/repository/ranking_repo.dart';
import 'package:flutter/material.dart';

class RankingProvider extends ChangeNotifier {
  // EvRepository를 접근(데이터를 받아와야 하기 때문에)
  final RankingRepository _rankingRepository = RankingRepository();

  List<Ranking> _top10rankings = [];
  List<Ranking> get top10rankings => _top10rankings;

  List<Ranking> _playRankings = [];
  List<Ranking> get playRankings => _playRankings;

  List<Ranking> _musicalRankings = [];
  List<Ranking> get musicalRankings => _musicalRankings;

  List<Ranking> _classicRankings = [];
  List<Ranking> get classicRankings => _classicRankings;

  List<Ranking> _koreanRankings = [];
  List<Ranking> get koreanRankings => _koreanRankings;

  List<Ranking> _popularRankings = [];
  List<Ranking> get popularRankings => _popularRankings;

  List<Ranking> _danceRankings = [];
  List<Ranking> get danceRankings => _danceRankings;

  List<Ranking> _circusRankings = [];
  List<Ranking> get circusRankings => _circusRankings;

  List<Ranking> _complexRankings = [];
  List<Ranking> get complexRankings => _complexRankings;

  List<Ranking> _kidRankings = [];
  List<Ranking> get kidRankings => _kidRankings;

  // 데이터 로드
  loadTop10Rankings() async {
    List<Ranking>? listRankings = await _rankingRepository.loadTop10Rankings();
    _top10rankings = listRankings!;
    notifyListeners(); // 데이터가 업데이트가 됐으면 구독자에게 알린다.
  }

  loadPlayRankings() async {
    List<Ranking>? listPlayRankings = await _rankingRepository.loadPlayRankings('AAAA');
    _playRankings = listPlayRankings!;
    notifyListeners();
  }

  loadMusicalRankings() async {
    List<Ranking>? listMusicalRankings = await _rankingRepository.loadMusicalRankings('GGGA');
    _musicalRankings = listMusicalRankings!;
    notifyListeners();
  }

  loadClassicRankings() async {
    List<Ranking>? listClassicRankings = await _rankingRepository.loadClassicRankings('CCCA');
    _classicRankings = listClassicRankings!;
    notifyListeners();
  }

  loadKoreanRankings() async {
    List<Ranking>? listKoreanRankings = await _rankingRepository.loadKoreanRankings('CCCC');
    _koreanRankings = listKoreanRankings!;
    notifyListeners();
  }

  loadPopularRankings() async {
    List<Ranking>? listPopularyRankings = await _rankingRepository.loadPopularRankings('CCCD');
    _popularRankings = listPopularyRankings!;
    notifyListeners();
  }

  loadDanceRankings() async {
    List<Ranking>? listDanceRankings = await _rankingRepository.loadDanceRankings('BBBC');
    _danceRankings = listDanceRankings!;
    notifyListeners();
  }

  loadCircusRankings() async {
    List<Ranking>? listCircusRankings = await _rankingRepository.loadCircusRankings('EEEB');
    _circusRankings = listCircusRankings!;
    notifyListeners();
  }

  loadComplexRankings() async {
    List<Ranking>? listComplexRankings = await _rankingRepository.loadComplexRankings('EEEA');
    _complexRankings = listComplexRankings!;
    notifyListeners();
  }

  loadKidRankings() async {
    List<Ranking>? listKidRankings = await _rankingRepository.loadKidRankings('KID');
    _kidRankings = listKidRankings!;
    notifyListeners();
  }
}