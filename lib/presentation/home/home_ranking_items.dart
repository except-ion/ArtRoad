import 'dart:core';

class RankingItems {
  // api 브랜치의 Ranking 클래스와 같음
  String? mt20id; // 공연 ID
  String? cate; //장르
  String? poster; //poster
  String? rnum; //순위

  RankingItems({
    this.mt20id,
    this.cate,
    this.poster,
    this.rnum,
  });

  factory RankingItems.fromJson(Map<String, dynamic> json) {
    return RankingItems(
      mt20id: json["mt20id"] as String?,
      cate: json["cate"] as String?,
      poster: json["poster"] as String?,
      rnum: json["rnum"] as String?,
    );
  }

  @override
  String toString() {
    return 'mt20id: $mt20id, cate: $cate, poster: $poster, rnum: $rnum';
  }
}
