import 'package:intl/intl.dart';

class DateFormatter {
  static String formatToTime(DateTime localTime) {
    return DateFormat(
      'h:mm a',
    ).format(localTime).toLowerCase(); // e.g., 11:50 PM
  }

  static String formatToDate(DateTime localTime) {
    return DateFormat(
      'dd/MM/yy',
    ).format(localTime).toLowerCase(); // e.g., 01/08/25
  }

  static String formatChatTimestamp(DateTime timestamp) {
    final now = DateTime.now();
    final localTime = timestamp.toLocal();

    final isSameDay =
        now.year == localTime.year &&
        now.month == localTime.month &&
        now.day == localTime.day;

    final yesterday = now.subtract(Duration(days: 1));
    final isYesterday =
        yesterday.year == localTime.year &&
        yesterday.month == localTime.month &&
        yesterday.day == localTime.day;

    if (isSameDay) {
      // e.g., 1:50 AM
      return formatToTime(localTime);
    } else if (isYesterday) {
      return 'Yesterday';
    } else {
      // e.g., 09/02/25
      return formatToDate(localTime);
    }
  }
}
