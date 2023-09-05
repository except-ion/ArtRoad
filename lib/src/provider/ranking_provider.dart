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
}