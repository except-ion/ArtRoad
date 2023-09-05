class Ranking {
  String? mt20id; // 공연 ID
  String? cate; //장르
  String? poster; //poster
  String? rnum; //순위


  Ranking({
    this.mt20id,
    this.cate,
    this.poster,
    this.rnum,
  });

  factory Ranking.fromJson(Map<String, dynamic> json) {
    return Ranking(
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
