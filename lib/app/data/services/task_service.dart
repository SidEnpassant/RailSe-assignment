import '../models/task_model.dart';
import 'package:railseassignment/core/enums/task_status.dart';

class TaskService {
  // Mock data service - In a real app, this would connect to an API or database

  List<TaskModel> getAllTasks() {
    return [
      TaskModel(
        id: 'task_1043',
        title: 'Order-1043',
        description: 'Arrange Pickup',
        assignee: 'Sandhya',
        isHighPriority: true,
        status: TaskStatus.overdue,
        startDate: DateTime.now().subtract(Duration(days: 5)),
      ),
      TaskModel(
        id: 'task_2559',
        title: 'Entity-2559',
        description: 'Adhoc Task',
        assignee: 'Arman',
        isHighPriority: false,
        status: TaskStatus.overdue,
        startDate: DateTime.now().subtract(Duration(days: 16)),
      ),
      TaskModel(
        id: 'task_1020',
        title: 'Order-1020',
        description: 'Collect Payment',
        assignee: 'Sandhya',
        isHighPriority: true,
        status: TaskStatus.overdue,
        startDate: DateTime.now().subtract(Duration(days: 17)),
      ),
      TaskModel(
        id: 'task_194',
        title: 'Order-194',
        description: 'Arrange Delivery',
        assignee: 'Prashant',
        isHighPriority: false,
        status: TaskStatus.completed,
        startDate: DateTime.now().subtract(Duration(days: 1)),
        completedDate: DateTime(2024, 8, 21),
      ),
      TaskModel(
        id: 'task_2184',
        title: 'Entity-2184',
        description: 'Share Company Profile',
        assignee: 'Asif Khan K',
        isHighPriority: false,
        status: TaskStatus.completed,
        startDate: DateTime.now().subtract(Duration(days: 2)),
        completedDate: DateTime(2024, 8, 23),
      ),
      TaskModel(
        id: 'task_472',
        title: 'Entity-472',
        description: 'Add Followup',
        assignee: 'Avik',
        isHighPriority: false,
        status: TaskStatus.completed,
        startDate: DateTime.now().subtract(Duration(days: 3)),
        completedDate: DateTime(2024, 8, 26),
      ),
      TaskModel(
        id: 'task_3563',
        title: 'Enquiry-3563',
        description: 'Convert Enquiry',
        assignee: 'Prashant',
        isHighPriority: false,
        status: TaskStatus.notStarted,
        startDate: DateTime.now().add(Duration(days: 2)),
      ),
      TaskModel(
        id: 'task_176',
        title: 'Order-176',
        description: 'Arrange Pickup',
        assignee: 'Prashant',
        isHighPriority: true,
        status: TaskStatus.notStarted,
        startDate: DateTime.now().add(Duration(days: 1)),
      ),
    ];
  }
}
