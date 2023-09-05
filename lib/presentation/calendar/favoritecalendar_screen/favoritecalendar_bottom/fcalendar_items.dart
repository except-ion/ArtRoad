import 'dart:core';

class fCalendarItems {
  String? mt20id; // 공연 ID
  String? prfnm; // 공연명
  String? fcltynm; // 공연시설명
  String? prfpdfrom; //공연시작일
  String? prfpdto; //공연종료일

  fCalendarItems(this.mt20id, this.prfnm,
      this.fcltynm, this.prfpdfrom, this.prfpdto);
}