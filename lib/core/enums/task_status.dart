enum TaskStatus { notStarted, started, completed, overdue }

extension TaskStatusExtension on TaskStatus {
  String get displayName {
    switch (this) {
      case TaskStatus.notStarted:
        return 'Not Started';
      case TaskStatus.started:
        return 'Started';
      case TaskStatus.completed:
        return 'Completed';
      case TaskStatus.overdue:
        return 'Overdue';
    }
  }

  String get actionButtonText {
    switch (this) {
      case TaskStatus.notStarted:
        return 'Start Task';
      case TaskStatus.started:
        return 'Mark as complete';
      case TaskStatus.completed:
        return '';
      case TaskStatus.overdue:
        return 'Start Task';
    }
  }

  bool get canEdit {
    return this == TaskStatus.notStarted ||
        this == TaskStatus.started ||
        this == TaskStatus.overdue;
  }

  bool get showEditIcon {
    return this == TaskStatus.notStarted || this == TaskStatus.overdue;
  }

  bool get hasActionButton {
    return this == TaskStatus.notStarted ||
        this == TaskStatus.started ||
        this == TaskStatus.overdue;
  }
}
