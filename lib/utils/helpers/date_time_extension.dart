import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String get dayMonthYear {
    return DateFormat('dd MMM yyyy').format(this);
  }

  String get hourMinute {
    return DateFormat('kk:mm').format(this);
  }

  String get dayMonthYearHourMinute => '$dayMonthYear $hourMinute';
}
