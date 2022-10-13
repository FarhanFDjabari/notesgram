import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String get dayMonthYear {
    return DateFormat('dd-MM-yyyy').format(toLocal());
  }

  String get dayFullMonthYear {
    return DateFormat('dd MMMM yyyy').format(toLocal());
  }

  String get dayShortMonthYear {
    return DateFormat('dd MMM yyyy').format(toLocal());
  }

  String get hourMinute {
    return DateFormat('kk:mm').format(toLocal());
  }

  String get hourMinuteAmPm {
    return DateFormat('KK:MM a').format(toLocal());
  }

  String get dayMonthYearHourMinute => '$dayMonthYear $hourMinute';

  String get dayMonthYearHourMinuteFull => '$dayFullMonthYear, $hourMinuteAmPm';

  String get dayShortMonthYearHourMinute => '$dayShortMonthYear, $hourMinute';

  String get postTime {
    final timeDifference = DateTime.now().difference(this);
    int hourTime = timeDifference.inHours;
    int minuteTime = timeDifference.inMinutes;
    if (hourTime > 8765) {
      return '${(hourTime / 8766).round()} tahun';
    } else if (hourTime > 729) {
      return '${(hourTime / 730).round()} bulan';
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

  String get remainingTimeWeekly {
    final timeDifference = DateTime.now().difference(this);
    int hourTime = timeDifference.inHours;
    if (hourTime.abs() > 0) {
      return '${(hourTime / 23).round()} Hari';
    } else {
      return 'Expired';
    }
  }

  String get remainingTimeDaily {
    final timeDifference = DateTime.now().difference(this);
    int hourTime = timeDifference.inHours;
    if (hourTime.abs() > 0) {
      return '${hourTime.round()} Jam';
    } else {
      return 'Expired';
    }
  }

  String get remainingTimeMonthly {
    final timeDifference = DateTime.now().difference(this);
    int hourTime = timeDifference.inHours;
    if (hourTime.abs() > 0) {
      return '${(hourTime / 730).round()} Bulan';
    } else {
      return 'Expired';
    }
  }
}
