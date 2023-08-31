class DayOfWeek {
  String getDayOfWeek(DateTime date) {
    final List<String> daysOfWeek = ['일', '월', '화', '수', '목', '금', '토'];

    if (date.weekday == 7 ) return daysOfWeek[0]; // 일요일의 경우 0 인덱스를 사용
    else return daysOfWeek[date.weekday];
  }
}