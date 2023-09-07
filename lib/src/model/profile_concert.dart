//mypage에서 보여줄 관심공연을 위한 class
class ProfileConcert {
  String? mt20id; // 공연 ID
  String? prfnm; // 공연명
  String? fcltynm; // 공연시설명
  String? poster; //poster


  ProfileConcert(
    this.mt20id,
    this.prfnm,
    this.fcltynm,
    this.poster,
  );
}