import 'dart:core';

class fCalendarItems {
  String? mt20id; // 공연 ID
  String? mt10id;
  String? prfnm; // 공연명
  String? fcltynm; // 공연시설명
  DateTime prfpdfrom; //공연기간
  DateTime prfpdto; //공연기간

  fCalendarItems(
    this.mt20id,
    this.mt10id, 
    this.prfnm,
    this.fcltynm, 
    this.prfpdfrom, 
    this.prfpdto, 
    );
}