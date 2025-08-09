enum TaskStatus { notStarted, started, completed }

class Task {
  final String id;
  final String title;
  final String subtitle;
  final String assignee;
  TaskStatus status;
  DateTime startDate;
  DateTime? deadline;
  DateTime? completedDate;
  final bool isHighPriority;
  final TaskType type;

  Task({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.assignee,
    required this.status,
    required this.startDate,
    this.deadline,
    this.completedDate,
    this.isHighPriority = false,
    required this.type,
  });

  String get statusText {
    switch (status) {
      case TaskStatus.notStarted:
        return _getDueDuration();
      case TaskStatus.started:
        return 'Overdue - ${_getOverdueDuration()}';
      case TaskStatus.completed:
        return 'Completed: ${_getFormattedDate(completedDate!)}';
    }
  }

  String _getDueDuration() {
    final now = DateTime.now();
    final difference = startDate.difference(now);

    if (difference.inDays >= 1) {
      return 'Due in ${difference.inDays} days';
    } else if (difference.inDays == 0) {
      return 'Due Tomorrow';
    } else {
      return 'Due Today';
    }
  }

  String _getOverdueDuration() {
    if (deadline == null) return '0h 0m';

    final now = DateTime.now();
    final difference = now.difference(deadline!);

    if (difference.inDays > 0) {
      return '${difference.inDays}d ${difference.inHours % 24}h ${difference.inMinutes % 60}m';
    } else if (difference.inHours > 0) {
      return '${difference.inHours}h ${difference.inMinutes % 60}m';
    } else {
      return '${difference.inMinutes}m';
    }
  }

  String _getFormattedDate(DateTime date) {
    final months = [
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
    return '${months[date.month - 1]} ${date.day}';
  }

  String get formattedStartDate {
    if (status == TaskStatus.notStarted) {
      return 'Start: ${_getFormattedStartDate()}';
    } else {
      return 'Started: ${_getFormattedStartDate()}';
    }
  }

  String _getFormattedStartDate() {
    final months = [
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
    return '${months[startDate.month - 1]} ${startDate.day}';
  }
}

enum TaskType { order, entity, enquiry }
