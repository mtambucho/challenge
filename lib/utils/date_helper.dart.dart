extension DateHelper on DateTime {
  ///print only date without time
  String toDateOnly() {
    return '$day/$month/$year';
  }
}
