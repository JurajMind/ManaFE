class DateHelper {
  static bool CompareDate(DateTime x, DateTime y) {
    return x.day == y.day && x.month == y.month && x.year == y.year;
  }
}
