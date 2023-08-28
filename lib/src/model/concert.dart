class Concert {
  String? mt20id; // 공연 ID
  String? prfnm; // 공연명
  String? fcltynm; // 공연시설명
  String? poster;

  Concert({
    this.mt20id,
    this.prfnm,
    this.fcltynm,
    this.poster,
  });

  factory Concert.fromJson(Map<String, dynamic> json) {
    return Concert(
      mt20id: json["mt20id"] as String?,
      prfnm: json["prfnm"] as String?,
      fcltynm: json["fcltynm"] as String?,
      poster: json["poster"] as String?,
    );
  }
}