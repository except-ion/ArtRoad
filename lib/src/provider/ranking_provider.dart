import 'package:artroad/src/repository/ranking_repo.dart';
import 'package:flutter/material.dart';
import 'package:artroad/presentation/home/home_ranking_items.dart';

class RankingProvider extends ChangeNotifier {
  // EvRepository를 접근(데이터를 받아와야 하기 때문에)
  final RankingRepository _rankingRepository = RankingRepository();

  List<RankingItems> _rankings = [];
  List<RankingItems> get rankings => _rankings;

  // 데이터 로드
  loadTop10Rankings() async {
    // EvRepository 접근해서 데이터를 로드
    // listEvs에 _evs를 바로 작성해도 되지만 예외 처리와 추가적인 가공을 위해 나눠서 작성한다.
    List<RankingItems>? listRankings = await _rankingRepository.loadTop10Rankings();
    _rankings = listRankings!;
    notifyListeners(); // 데이터가 업데이트가 됐으면 구독자에게 알린다.
  }
}