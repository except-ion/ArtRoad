//데이터를 클래스로 만들어 관리

class Concert {
  String? mt20id; // 공연 ID
  String? prfstate; // 공연상태
  String? prfnm; // 공연명
  String? prfpdfrom; // 공연 시작일
  String? prfpdto; // 공연 종료일

  Concert({
    this.mt20id,
    this.prfstate,
    this.prfnm,
    this.prfpdfrom,
    this.prfpdto,
  });

  factory Concert.fromJson(Map<String, dynamic> json) {
    return Concert(
      mt20id: json["mt20id"] as String,
      prfstate: json["prfstate"] as String,
      prfnm: json["prfnm"] as String,
      prfpdfrom: json["prfpdfrom"] as String,
      prfpdto: json["prfpdto"] as String
    );
  }
}