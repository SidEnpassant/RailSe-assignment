import 'package:railseassignment/core/enums/task_status.dart';

// class TaskModel {
//   final String id;
//   final String title;
//   final String description;
//   final String assignee;
//   final bool isHighPriority;
//   TaskStatus status;
//   DateTime startDate;
//   final DateTime? completedDate;

//   TaskModel({
//     required this.id,
//     required this.title,
//     required this.description,
//     required this.assignee,
//     this.isHighPriority = false,
//     required this.status,
//     required this.startDate,
//     this.completedDate,
//   });

//   // Check if task is overdue
//   bool get isOverdue {
//     if (status == TaskStatus.completed) return false;
//     return DateTime.now().isAfter(startDate) && status != TaskStatus.started;
//   }

//   // Get actual display status considering overdue
//   TaskStatus get displayStatus {
//     if (isOverdue && status != TaskStatus.completed) {
//       return TaskStatus.overdue;
//     }
//     return status;
//   }

//   // Get days difference for display
//   String get timeInfo {
//     final now = DateTime.now();
//     final difference = startDate.difference(now).inDays;

//     if (status == TaskStatus.completed) {
//       return completedDate != null
//           ? 'Completed: ${_formatDate(completedDate!)}'
//           : 'Completed';
//     }

//     if (difference == 0) {
//       return 'Due Today';
//     } else if (difference == 1) {
//       return 'Due Tomorrow';
//     } else if (difference > 1) {
//       return 'Due in ${difference} days';
//     } else if (difference == -1) {
//       return 'Overdue - 1 day';
//     } else {
//       return 'Overdue - ${difference.abs()} days';
//     }
//   }

//   String _formatDate(DateTime date) {
//     const months = [
//       'Jan',
//       'Feb',
//       'Mar',
//       'Apr',
//       'May',
//       'Jun',
//       'Jul',
//       'Aug',
//       'Sep',
//       'Oct',
//       'Nov',
//       'Dec',
//     ];
//     return '${months[date.month - 1]} ${date.day}';
//   }

//   String get startDateFormatted {
//     return 'Start: ${_formatDate(startDate)}';
//   }

//   TaskModel copyWith({
//     String? id,
//     String? title,
//     String? description,
//     String? assignee,
//     bool? isHighPriority,
//     TaskStatus? status,
//     DateTime? startDate,
//     DateTime? completedDate,
//   }) {
//     return TaskModel(
//       id: id ?? this.id,
//       title: title ?? this.title,
//       description: description ?? this.description,
//       assignee: assignee ?? this.assignee,
//       isHighPriority: isHighPriority ?? this.isHighPriority,
//       status: status ?? this.status,
//       startDate: startDate ?? this.startDate,
//       completedDate: completedDate ?? this.completedDate,
//     );
//   }
// }

class TaskModel {
  final String id;
  final String title;
  final String description;
  final String assignee;
  final bool isHighPriority;
  TaskStatus status;
  DateTime startDate;
  DateTime deadline;
  final DateTime? completedDate;

  TaskModel({
    required this.id,
    required this.title,
    required this.description,
    required this.assignee,
    this.isHighPriority = false,
    required this.status,
    required this.startDate,
    required this.deadline,
    this.completedDate,
  });

  // Check if task is overdue
  bool get isOverdue {
    if (status == TaskStatus.completed) return false;
    return DateTime.now().isAfter(deadline) && status != TaskStatus.started;
  }

  // Get actual display status considering overdue
  TaskStatus get displayStatus {
    if (isOverdue && status != TaskStatus.completed) {
      return TaskStatus.overdue;
    }
    return status;
  }

  // Get days difference for display
  String get timeInfo {
    final now = DateTime.now();
    final difference = deadline.difference(now).inDays;

    if (status == TaskStatus.completed) {
      return completedDate != null
          ? 'Completed: ${_formatDate(completedDate!)}'
          : 'Completed';
    }

    if (difference == 0) {
      return 'Due Today';
    } else if (difference == 1) {
      return 'Due Tomorrow';
    } else if (difference > 1) {
      return 'Due in ${difference} days';
    } else if (difference == -1) {
      return 'Overdue - 1 day';
    } else {
      return 'Overdue - ${difference.abs()} days';
    }
  }

  String _formatDate(DateTime date) {
    const months = [
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

  String get startDateFormatted {
    return 'Start: ${_formatDate(startDate)}';
  }

  String get deadlineFormatted {
    return 'Due: ${_formatDate(deadline)}';
  }

  TaskModel copyWith({
    String? id,
    String? title,
    String? description,
    String? assignee,
    bool? isHighPriority,
    TaskStatus? status,
    DateTime? startDate,
    DateTime? deadline,
    DateTime? completedDate,
  }) {
    return TaskModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      assignee: assignee ?? this.assignee,
      isHighPriority: isHighPriority ?? this.isHighPriority,
      status: status ?? this.status,
      startDate: startDate ?? this.startDate,
      deadline: deadline ?? this.deadline,
      completedDate: completedDate ?? this.completedDate,
    );
  }
}
