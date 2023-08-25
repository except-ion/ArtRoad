class Concert {
  String? mt20id; // 공연 ID
  String? prfnm; // 공연명
  String? shprfnmfct; // 공연시설명

  Concert({
    this.mt20id,
    this.prfnm,
    this.shprfnmfct,
  });

  factory Concert.fromJson(Map<String, dynamic> json) {
    return Concert(
      mt20id: json["mt20id"] as String,
      prfnm: json["prfnm"] as String,
      shprfnmfct: json["shprfnmfct"] as String,
    );
  }
}