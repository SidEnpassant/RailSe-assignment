import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../data/models/task_model.dart';
import '../controllers/task_controller.dart';
import '../../core/constants/app_colors.dart';
import '../../core/enums/task_status.dart';

class CustomTaskCard extends StatelessWidget {
  final TaskModel task;

  const CustomTaskCard({Key? key, required this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<TaskController>();
    final displayStatus = task.displayStatus;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Row
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Task Title and ID
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          task.title,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: _getStatusColor(displayStatus),
                            decoration: TextDecoration.underline,
                            decorationColor: _getStatusColor(displayStatus),
                          ),
                        ),
                        SizedBox(width: 8),
                        Text(
                          ':',
                          style: TextStyle(
                            fontSize: 16,
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 4),
                    Text(
                      task.description,
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.textSecondary,
                      ),
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Text(
                          task.assignee,
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.textPrimary,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        if (task.isHighPriority) ...[
                          SizedBox(width: 8),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.highPriority,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              'High Priority',
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                  ],
                ),
              ),

              // Status and Time Info
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: _getStatusBackgroundColor(displayStatus),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      task.timeInfo,
                      style: TextStyle(
                        fontSize: 12,
                        color: _getStatusTextColor(displayStatus),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  // Date with edit icon
                  if (displayStatus != TaskStatus.completed)
                    GestureDetector(
                      onTap: displayStatus.canEdit
                          ? () => controller.showDatePicker(
                              task.id,
                              task.startDate,
                            )
                          : null,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            task.startDateFormatted,
                            style: TextStyle(
                              fontSize: 12,
                              color: AppColors.textSecondary,
                            ),
                          ),
                          if (displayStatus.showEditIcon) ...[
                            SizedBox(width: 4),
                            Icon(
                              Icons.edit,
                              size: 12,
                              color: AppColors.textSecondary,
                            ),
                          ],
                        ],
                      ),
                    ),
                ],
              ),
            ],
          ),

          // Action Button
          if (displayStatus.hasActionButton) ...[
            SizedBox(height: 16),
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () =>
                    _onActionButtonTap(controller, task.id, displayStatus),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: _getActionButtonColor(displayStatus),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    displayStatus.actionButtonText,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ] else if (displayStatus == TaskStatus.completed) ...[
            SizedBox(height: 8),
            Align(
              alignment: Alignment.centerRight,
              child: Icon(
                Icons.check_circle,
                color: AppColors.completedPrimary,
                size: 20,
              ),
            ),
          ],
        ],
      ),
    );
  }

  Color _getStatusColor(TaskStatus status) {
    switch (status) {
      case TaskStatus.notStarted:
        return AppColors.notStartedPrimary;
      case TaskStatus.started:
        return AppColors.startedPrimary;
      case TaskStatus.completed:
        return AppColors.completedPrimary;
      case TaskStatus.overdue:
        return AppColors.overduePrimary;
    }
  }

  Color _getStatusBackgroundColor(TaskStatus status) {
    switch (status) {
      case TaskStatus.notStarted:
        return AppColors.notStartedBackground;
      case TaskStatus.started:
        return AppColors.startedBackground;
      case TaskStatus.completed:
        return AppColors.completedBackground;
      case TaskStatus.overdue:
        return AppColors.overdueBackground;
    }
  }

  Color _getStatusTextColor(TaskStatus status) {
    switch (status) {
      case TaskStatus.notStarted:
        return AppColors.notStartedText;
      case TaskStatus.started:
        return AppColors.startedText;
      case TaskStatus.completed:
        return AppColors.completedText;
      case TaskStatus.overdue:
        return AppColors.overdueText;
    }
  }

  Color _getActionButtonColor(TaskStatus status) {
    switch (status) {
      case TaskStatus.notStarted:
      case TaskStatus.overdue:
        return AppColors.buttonPrimary;
      case TaskStatus.started:
        return AppColors.buttonSuccess;
      case TaskStatus.completed:
        return AppColors.buttonSuccess;
    }
  }

  void _onActionButtonTap(
    TaskController controller,
    String taskId,
    TaskStatus status,
  ) {
    switch (status) {
      case TaskStatus.notStarted:
      case TaskStatus.overdue:
        controller.startTask(taskId);
        break;
      case TaskStatus.started:
        controller.markTaskComplete(taskId);
        break;
      case TaskStatus.completed:
        // No action for completed tasks
        break;
    }
  }
}
