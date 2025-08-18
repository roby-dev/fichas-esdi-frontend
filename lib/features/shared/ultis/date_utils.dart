import 'package:intl/intl.dart';

class DateUtilsEsdi {
  static String formatDate(DateTime date) {
    return DateFormat("dd MMM. yyyy", "es_ES").format(date.toUtc());
  }

  static String formatDateLong(DateTime date) {
    return DateFormat(
      "EEEE d 'de' MMMM 'del' yyyy",
      "es_ES",
    ).format(date.toUtc());
  }

  static int monthsBetween(DateTime start, DateTime end) {
    return (end.year - start.year) * 12 + end.month - start.month;
  }

  static int monthsBetweenFullUtc(DateTime startUtc, DateTime endUtc) {
    final a = DateTime.utc(startUtc.year, startUtc.month, startUtc.day);
    final b = DateTime.utc(endUtc.year, endUtc.month, endUtc.day);

    int months = (b.year - a.year) * 12 + (b.month - a.month);
    if (b.day < a.day) months -= 1;

    return months;
  }

  static String formatDateRange(DateTime from, DateTime to) {
    final sameYear = from.year == to.year;
    final sameMonth = from.month == to.month && sameYear;

    if (sameYear) {
      if (sameMonth) {
        return "${DateFormat("d", "es_ES").format(from)} al ${DateFormat("d 'de' MMMM 'de' yyyy", "es_ES").format(to)}";
      } else {
        return "${DateFormat("d 'de' MMMM", "es_ES").format(from)} hasta el ${DateFormat("d 'de' MMMM 'de' yyyy", "es_ES").format(to)}";
      }
    }

    return "${formatDateLong(from)} hasta el ${formatDateLong(to)}";
  }
}
