import 'package:intl/intl.dart';

class DateFormatter {
  static const List<String> _monthNames = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec',
  ];

  /// Format date as "Aug 21"
  static String formatShort(DateTime date) {
    return '${_monthNames[date.month - 1]} ${date.day}';
  }

  /// Format date as "August 21, 2024"
  static String formatLong(DateTime date) {
    return DateFormat('MMMM dd, yyyy').format(date);
  }

  /// Format date as "21/08/2024"
  static String formatSlash(DateTime date) {
    return DateFormat('dd/MM/yyyy').format(date);
  }

  /// Get time difference text
  static String getTimeDifferenceText(DateTime targetDate, {DateTime? from}) {
    final now = from ?? DateTime.now();
    final difference = targetDate.difference(now).inDays;

    if (difference == 0) {
      return 'Today';
    } else if (difference == 1) {
      return 'Tomorrow';
    } else if (difference > 1) {
      return 'In $difference days';
    } else if (difference == -1) {
      return '1 day ago';
    } else {
      return '${difference.abs()} days ago';
    }
  }

  /// Get overdue text
  static String getOverdueText(DateTime dueDate, {DateTime? from}) {
    final now = from ?? DateTime.now();
    final difference = now.difference(dueDate).inDays;

    if (difference == 1) {
      return 'Overdue - 1 day';
    } else {
      return 'Overdue - $difference days';
    }
  }

  /// Get due text for task cards
  static String getDueText(DateTime dueDate, {DateTime? from}) {
    final now = from ?? DateTime.now();
    final difference = dueDate.difference(now).inDays;

    if (difference == 0) {
      return 'Due Today';
    } else if (difference == 1) {
      return 'Due Tomorrow';
    } else if (difference > 1) {
      return 'Due in $difference days';
    } else {
      return getOverdueText(dueDate, from: from);
    }
  }

  /// Check if date is today
  static bool isToday(DateTime date) {
    final now = DateTime.now();
    return date.year == now.year &&
        date.month == now.month &&
        date.day == now.day;
  }

  /// Check if date is tomorrow
  static bool isTomorrow(DateTime date) {
    final tomorrow = DateTime.now().add(Duration(days: 1));
    return date.year == tomorrow.year &&
        date.month == tomorrow.month &&
        date.day == tomorrow.day;
  }

  /// Check if date is overdue
  static bool isOverdue(DateTime date) {
    final now = DateTime.now();
    return date.isBefore(DateTime(now.year, now.month, now.day));
  }
}
