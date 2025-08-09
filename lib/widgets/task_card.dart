import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/task.dart';
import '../providers/task_provider.dart';

class TaskCard extends StatelessWidget {
  final Task task;

  const TaskCard({Key? key, required this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      child: IntrinsicHeight(
        child: Row(
          children: [
            // Left border
            Container(
              width: 4,
              decoration: BoxDecoration(
                color: _getLeftBorderColor(),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  bottomLeft: Radius.circular(8),
                ),
              ),
              child: task.status == TaskStatus.notStarted
                  ? CustomPaint(painter: DottedBorderPainter())
                  : null,
            ),
            // Main card content
            Expanded(
              child: Opacity(
                opacity: task.status == TaskStatus.completed ? 0.6 : 1.0,
                child: Card(
                  elevation: 2,
                  margin: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(8),
                      bottomRight: Radius.circular(8),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
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
                                          color: _getTitleColor(),
                                          decoration:
                                              task.status ==
                                                  TaskStatus.completed
                                              ? TextDecoration.lineThrough
                                              : null,
                                        ),
                                      ),
                                      SizedBox(width: 8),
                                      Icon(
                                        Icons.more_vert,
                                        color: Colors.black,
                                        size: 20,
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 4),

                                  Text(
                                    task.subtitle,
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      decoration:
                                          task.status == TaskStatus.completed
                                          ? TextDecoration.lineThrough
                                          : null,
                                    ),
                                  ),

                                  SizedBox(height: 8),
                                  Row(
                                    children: [
                                      Text(
                                        task.assignee,
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      if (task.isHighPriority) ...[
                                        SizedBox(width: 8),
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 6,
                                            vertical: 2,
                                          ),
                                          // decoration: BoxDecoration(
                                          //   color: Colors.red[50],
                                          //   borderRadius: BorderRadius.circular(
                                          //     4,
                                          //   ),
                                          // ),
                                          child: Text(
                                            'High Priority',
                                            style: TextStyle(
                                              fontSize: 11,
                                              color: Colors.red[700],
                                              fontWeight: FontWeight.w800,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 8,
                                        vertical: 4,
                                      ),
                                      decoration: BoxDecoration(
                                        color: _getStatusBackgroundColor(),
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      child: Text(
                                        task.statusText,
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: _getStatusTextColor(),
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                    ),
                                    if (task.status == TaskStatus.started ||
                                        task.status ==
                                            TaskStatus.notStarted) ...[
                                      // SizedBox(width: 4),
                                      GestureDetector(
                                        onTap: () {
                                          print(
                                            'Edit icon tapped for task: ${task.id}, status: ${task.status}',
                                          );
                                          if (task.status ==
                                              TaskStatus.started) {
                                            _showDeadlinePicker(context);
                                          } else {
                                            _showDueDatePicker(context);
                                          }
                                        },
                                        child: Container(
                                          padding: EdgeInsets.all(4),
                                          child: Icon(
                                            Icons.edit_outlined,
                                            size: 14,
                                            color: const Color.fromARGB(
                                              255,
                                              0,
                                              0,
                                              0,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ],
                                ),
                                if (task.status == TaskStatus.completed) ...[
                                  Row(
                                    children: [
                                      Text(
                                        task.formattedStartDate,
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w900,
                                          color: Colors.grey[600],
                                        ),
                                      ),
                                      // if (task.status ==
                                      //     TaskStatus.notStarted) ...[
                                      //   SizedBox(width: 4),
                                      //   GestureDetector(
                                      //     onTap: () => _showDatePicker(context),
                                      //     child: Icon(
                                      //       Icons.edit,
                                      //       size: 14,
                                      //       color: Colors.grey[500],
                                      //     ),
                                      //   ),
                                      // ],
                                    ],
                                  ),
                                ],
                                if (task.status == TaskStatus.notStarted) ...[
                                  Row(
                                    children: [
                                      Text(
                                        task.formattedStartDate,
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w900,
                                          color: Colors.grey[600],
                                        ),
                                      ),
                                      if (task.status ==
                                          TaskStatus.notStarted) ...[
                                        SizedBox(width: 4),
                                        GestureDetector(
                                          onTap: () => _showDatePicker(context),
                                          child: Icon(
                                            Icons.edit,
                                            size: 14,
                                            color: Colors.grey[500],
                                          ),
                                        ),
                                      ],
                                    ],
                                  ),
                                ],
                                if (task.status == TaskStatus.started) ...[
                                  Row(
                                    children: [
                                      Text(
                                        task.formattedStartDate,
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w900,
                                          color: Colors.grey[600],
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 8),
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        Icons.check_circle_sharp,
                                        color: Colors.green,
                                        weight: 100,
                                        size: 16,
                                      ),
                                      SizedBox(width: 4),
                                      GestureDetector(
                                        onTap: () {
                                          Provider.of<TaskProvider>(
                                            context,
                                            listen: false,
                                          ).completeTask(task.id);
                                        },
                                        child: Text(
                                          'Mark as complete',
                                          style: TextStyle(
                                            fontSize: 12.5,
                                            fontWeight: FontWeight.w800,
                                            color: Colors.green,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                                SizedBox(height: 9),
                                if (task.status == TaskStatus.notStarted) ...[
                                  Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        Icons.play_circle_fill,
                                        color: const Color.fromARGB(
                                          255,
                                          0,
                                          4,
                                          232,
                                        ),
                                        size: 16,
                                      ),
                                      SizedBox(width: 4),
                                      GestureDetector(
                                        onTap: () {
                                          Provider.of<TaskProvider>(
                                            context,
                                            listen: false,
                                          ).startTask(task.id);
                                        },
                                        child: Text(
                                          'Start Task',
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: const Color.fromARGB(
                                              255,
                                              0,
                                              4,
                                              232,
                                            ),
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getTitleColor() {
    switch (task.type) {
      case TaskType.order:
        return Color.fromARGB(255, 0, 4, 232)!;
      // return Colors.blue[700]!;
      case TaskType.entity:
        return Color.fromARGB(255, 0, 4, 232)!;
      // return Colors.purple[600]!;
      case TaskType.enquiry:
        return Color.fromARGB(255, 0, 4, 232)!;
      // return Colors.orange[700]!;
    }
  }

  Color _getStatusBackgroundColor() {
    switch (task.status) {
      case TaskStatus.notStarted:
        return Colors.transparent!;
      // return Colors.orange[100]!;
      case TaskStatus.started:
        return Colors.transparent!;
      // return Colors.red[50]!;
      case TaskStatus.completed:
        return Colors.transparent!;
      // return Colors.green[50]!;
    }
  }

  Color _getStatusTextColor() {
    switch (task.status) {
      case TaskStatus.notStarted:
        return const Color.fromARGB(255, 154, 128, 1)!;
      case TaskStatus.started:
        return Colors.red[700]!;
      case TaskStatus.completed:
        return Colors.green[700]!;
    }
  }

  Color _getLeftBorderColor() {
    switch (task.status) {
      case TaskStatus.notStarted:
        return const Color.fromARGB(255, 113, 113, 113)!;
      case TaskStatus.started:
        return Colors.blue;
      case TaskStatus.completed:
        return Colors.green;
    }
  }

  void _showDatePicker(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: task.startDate,
      firstDate: DateTime.now().subtract(Duration(days: 365)),
      lastDate: DateTime.now().add(Duration(days: 365)),
    ).then((selectedDate) {
      if (selectedDate != null && selectedDate != task.startDate) {
        Provider.of<TaskProvider>(
          context,
          listen: false,
        ).updateTaskDueDate(task.id, selectedDate);
      }
    });
  }

  void _showDeadlinePicker(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now().add(Duration(days: 1)),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    ).then((selectedDate) {
      if (selectedDate != null) {
        Provider.of<TaskProvider>(
          context,
          listen: false,
        ).updateTaskDeadline(task.id, selectedDate);
      }
    });
  }

  void _showDueDatePicker(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: task.startDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    ).then((selectedDate) {
      if (selectedDate != null && selectedDate != task.startDate) {
        Provider.of<TaskProvider>(
          context,
          listen: false,
        ).updateTaskDueDate(task.id, selectedDate);
      }
    });
  }
}

// Custom painter for dotted border
class DottedBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey[300]!
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke;

    const dashHeight = 5.0;
    const dashSpace = 3.0;
    double startY = 0;

    while (startY < size.height) {
      canvas.drawLine(Offset(2, startY), Offset(2, startY + dashHeight), paint);
      startY += dashHeight + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
