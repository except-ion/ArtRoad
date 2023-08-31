class MaxNumOfWeeks {
  bool calculateMaxWeeksInMonth(DateTime datetime) {
    int daysInMonth = DateTime(datetime.year, datetime.month + 1, 0).day;
    int firstWeekDay = DateTime(datetime.year, datetime.month, 1).weekday;
    int daysInFirstWeek = 7 - firstWeekDay;
    int remainingDays = daysInMonth - daysInFirstWeek;

    if (1 + (remainingDays / 7).ceil() == 5) return true;
    else return false;
  }
}