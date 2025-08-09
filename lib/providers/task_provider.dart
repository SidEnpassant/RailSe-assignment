import 'package:flutter/material.dart';
import '../models/task.dart';

class TaskProvider extends ChangeNotifier {
  List<Task> _tasks = [
    Task(
      id: 'Order-1043',
      title: 'Order-1043',
      subtitle: 'Arrange Pickup',
      assignee: 'Sandhya',
      status: TaskStatus.started,
      startDate: DateTime(2025, 8, 10),
      deadline: DateTime(2025, 9, 15),
      isHighPriority: true,
      type: TaskType.order,
    ),
    Task(
      id: 'Entity-2559',
      title: 'Entity-2559',
      subtitle: 'Adhoc Task',
      assignee: 'Arman',
      status: TaskStatus.started,
      startDate: DateTime(2025, 8, 12),
      deadline: DateTime(2025, 9, 18),
      type: TaskType.entity,
    ),
    Task(
      id: 'Order-1020',
      title: 'Order-1020',
      subtitle: 'Collect Payment',
      assignee: 'Sandhya',
      status: TaskStatus.started,
      startDate: DateTime(2025, 8, 15),
      deadline: DateTime(2025, 9, 22),
      isHighPriority: true,
      type: TaskType.order,
    ),
    Task(
      id: 'Order-194',
      title: 'Order-194',
      subtitle: 'Arrange Delivery',
      assignee: 'Prashant',
      status: TaskStatus.completed,
      startDate: DateTime(2025, 8, 20),
      completedDate: DateTime(2025, 8, 21),
      type: TaskType.order,
    ),
    Task(
      id: 'Entity-2184',
      title: 'Entity-2184',
      subtitle: 'Share Company Profile',
      assignee: 'Asif Khan K',
      status: TaskStatus.completed,
      startDate: DateTime(2025, 8, 22),
      completedDate: DateTime(2025, 8, 23),
      type: TaskType.entity,
    ),
    Task(
      id: 'Entity-472',
      title: 'Entity-472',
      subtitle: 'Add Followup',
      assignee: 'Avik',
      status: TaskStatus.completed,
      startDate: DateTime(2025, 8, 25),
      completedDate: DateTime(2025, 8, 26),
      type: TaskType.entity,
    ),
    Task(
      id: 'Enquiry-3563',
      title: 'Enquiry-3563',
      subtitle: 'Convert Enquiry',
      assignee: 'Prashant',
      status: TaskStatus.notStarted,
      startDate: DateTime(2025, 8, 28),
      deadline: DateTime(2025, 8, 28),
      type: TaskType.enquiry,
    ),
    Task(
      id: 'Order-176',
      title: 'Order-176',
      subtitle: 'Arrange Pickup',
      assignee: 'Prashant',
      status: TaskStatus.notStarted,
      startDate: DateTime(2025, 9, 1),
      deadline: DateTime(2025, 8, 28),
      isHighPriority: true,
      type: TaskType.order,
    ),
  ];

  List<Task> get tasks => _tasks;

  void startTask(String taskId) {
    final taskIndex = _tasks.indexWhere((task) => task.id == taskId);
    if (taskIndex != -1) {
      _tasks[taskIndex].status = TaskStatus.started;
      // Set default deadline to 7 days from start date
      _tasks[taskIndex].deadline = _tasks[taskIndex].startDate.add(
        Duration(days: 7),
      );
      notifyListeners();
    }
  }

  void completeTask(String taskId) {
    final taskIndex = _tasks.indexWhere((task) => task.id == taskId);
    if (taskIndex != -1) {
      _tasks[taskIndex].status = TaskStatus.completed;
      _tasks[taskIndex].completedDate = DateTime.now();
      notifyListeners();
    }
  }

  void updateTaskDeadline(String taskId, DateTime newDeadline) {
    final taskIndex = _tasks.indexWhere((task) => task.id == taskId);
    if (taskIndex != -1) {
      _tasks[taskIndex].deadline = newDeadline;
      notifyListeners();
    }
  }

  void updateTaskDueDate(String taskId, DateTime newDueDate) {
    final taskIndex = _tasks.indexWhere((task) => task.id == taskId);
    if (taskIndex != -1) {
      _tasks[taskIndex].startDate = newDueDate;
      notifyListeners();
    }
  }
}
