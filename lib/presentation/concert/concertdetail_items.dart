import 'dart:core';

class ConcertItems {
  String? mt20id; // 공연 ID
  String? prfnm; // 공연명
  String? poster; //포스터
  String? prfpdfrom; //공연 시작일
  String? prfpdto; //공연 종료일
  String? prfruntime; //공연 런타임
  String? prfage; //공연 관람 연령
  String? genrenm; //공연 장르
  String? fcltynm; // 공연시설명
  String? styurls; //소개이미지 목록

  ConcertItems(
      {this.mt20id,
      this.prfnm,
      this.poster,
      this.prfpdfrom,
      this.prfpdto,
      this.prfruntime,
      this.prfage,
      this.genrenm,
      this.fcltynm,
      this.styurls});

  factory ConcertItems.fromJson(Map<String, dynamic> json) {
    return ConcertItems(
      mt20id: json["mt20id"] as String?,
      prfnm: json["prfnm"] as String?,
      poster: json["poster"] as String?,
      prfpdfrom: json["prfpdfrom"] as String?,
      prfpdto: json["prfpdto"] as String?,
      prfruntime: json["prfruntime"] as String?,
      prfage: json["prfage"] as String?,
      genrenm: json["genrenm"] as String?,
      fcltynm: json["fcltynm"] as String?,
      styurls: (json["styurls"] as Map<String, dynamic>)['styurl'] as String?,
    );
  }
}
