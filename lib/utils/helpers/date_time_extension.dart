import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String get dayMonthYear {
    return DateFormat('dd-MM-yyyy').format(this);
  }

  String get dayFullMonthYear {
    return DateFormat('dd MMMM yyyy').format(this);
  }

  String get hourMinute {
    return DateFormat('kk:mm').format(this);
  }

  String get hourMinuteAmPm {
    return DateFormat('kk:mm a').format(this);
  }

  String get dayMonthYearHourMinute => '$dayMonthYear $hourMinute';

  String get dayMonthYearHourMinuteFull => '$dayFullMonthYear, $hourMinuteAmPm';

  String get postTime {
    final timeDifference = DateTime.now().difference(this);
    int hourTime = timeDifference.inHours;
    int minuteTime = timeDifference.inMinutes;
    if (hourTime > 8765) {
      return '${(hourTime / 8766).round()} tahun';
    } else if (hourTime > 729) {
      return '${(hourTime / 730).round()} jam';
    } else if (hourTime > 23) {
      return '${(hourTime / 23).round()} hari';
    } else if (hourTime > 0) {
      return '$hourTime jam';
    } else if (minuteTime > 0) {
      return '$minuteTime menit';
    }
    return 'Baru saja';
  }

  bool isSameDate(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }
}
