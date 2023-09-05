class FacilityDetail {
  String? mt10id; // 공연시설 ID
  String? fcltynm; // 공연시설명
  String? telno; //전화번호
  String? relateurl; //홈페이지
  String? adres; //주소
  String? la; //위도
  String? lo; //경도

  FacilityDetail({
    this.mt10id,
    this.fcltynm,
    this.telno,
    this.relateurl,
    this.adres,
    this.la,
    this.lo,
  });

  factory FacilityDetail.fromJson(Map<String, dynamic> json) {
    return FacilityDetail(
      mt10id: json["mt10id"] as String,
      fcltynm: json["fcltynm"] as String,
      telno: json["telno"] as String,
      relateurl: json["relateurl"] as String,
      adres: json["adres"] as String,
      la: json["la"] as String,
      lo: json["lo"] as String,
    );
  }
}