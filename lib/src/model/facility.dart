class Facility {
  String? mt10id; // 공연시설 ID
  String? fcltynm; // 공연시설명

  Facility({
    this.mt10id,
    this.fcltynm,
  });

  factory Facility.fromJson(Map<String, dynamic> json) {
    return Facility(
      mt10id: json["mt10id"] as String,
      fcltynm: json["fcltynm"] as String,
    );
  }
}