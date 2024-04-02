class DateToStringConverter {
  static String convert(DateTime date) {
    var dateSplited = date.toString().split(' ');

    return dateSplited.first;
  }
}
