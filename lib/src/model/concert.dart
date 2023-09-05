class Concert {
  String? mt20id; // 공연 ID
  String? prfnm; // 공연명
  String? fcltynm; // 공연시설명
  String? poster; //poster
  String? prfpdfrom; //공연시작일
  String? prfpdto; //공연종료일


  Concert({
    this.mt20id,
    this.prfnm,
    this.fcltynm,
    this.poster,
    this.prfpdfrom,
    this.prfpdto,
  });

  factory Concert.fromJson(Map<String, dynamic> json) {
    return Concert(
      mt20id: json["mt20id"] as String?,
      prfnm: json["prfnm"] as String?,
      fcltynm: json["fcltynm"] as String?,
      poster: json["poster"] as String?,
      prfpdfrom: json["prfpdfrom"] as String?,
      prfpdto: json["prfpdto"] as String?,
    );
  }
}