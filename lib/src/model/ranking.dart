class Ranking {
  String? mt20id; // 공연 ID
  String? prfnm;  //공연명
  String? cate; //장르
  String? poster; //poster
  String? rnum; //순위
  String? prfpd; //공연시작일

  Ranking({
    this.mt20id,
    this.prfnm,
    this.cate,
    this.poster,
    this.rnum,
    this.prfpd,
  });

  factory Ranking.fromJson(Map<String, dynamic> json) {
    return Ranking(
      mt20id: json["mt20id"] as String? ?? '',
      prfnm: json["prfnm"] as String? ?? '',
      cate: json["cate"] as String? ?? '',
      poster: json["poster"] as String?,
      rnum: json["rnum"] as String? ?? '',
      prfpd: json["prfpd"] as String? ?? '',
    );
  }
}
