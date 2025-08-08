import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../data/models/task_model.dart';
import '../data/services/task_service.dart';
import '../../core/enums/task_status.dart';

class TaskController extends GetxController {
  final TaskService _taskService = TaskService();

  // Observable list of tasks
  final RxList<TaskModel> tasks = <TaskModel>[].obs;

  // Loading state
  final RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadTasks();
  }

  void loadTasks() {
    try {
      isLoading.value = true;
      tasks.value = _taskService.getAllTasks();
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to load tasks',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }

  void startTask(String taskId) {
    try {
      final taskIndex = tasks.indexWhere((task) => task.id == taskId);
      if (taskIndex != -1) {
        final updatedTask = tasks[taskIndex].copyWith(
          status: TaskStatus.started,
        );
        tasks[taskIndex] = updatedTask;

        Get.snackbar(
          'Task Started',
          'Task has been started successfully',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.green,
          colorText: Colors.white,
          duration: Duration(seconds: 2),
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to start task',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  void markTaskComplete(String taskId) {
    try {
      final taskIndex = tasks.indexWhere((task) => task.id == taskId);
      if (taskIndex != -1) {
        final updatedTask = tasks[taskIndex].copyWith(
          status: TaskStatus.completed,
          completedDate: DateTime.now(),
        );
        tasks[taskIndex] = updatedTask;

        Get.snackbar(
          'Task Completed',
          'Task has been marked as complete',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.green,
          colorText: Colors.white,
          duration: Duration(seconds: 2),
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to complete task',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  void updateTaskDate(String taskId, DateTime newDate) {
    try {
      final taskIndex = tasks.indexWhere((task) => task.id == taskId);
      if (taskIndex != -1) {
        final updatedTask = tasks[taskIndex].copyWith(startDate: newDate);
        tasks[taskIndex] = updatedTask;

        Get.snackbar(
          'Date Updated',
          'Task date has been updated successfully',
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.blue,
          colorText: Colors.white,
          duration: Duration(seconds: 2),
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to update task date',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  Future<void> showDatePicker(String taskId, DateTime currentDate) async {
    final DateTime? pickedDate = await Get.dialog<DateTime>(
      AlertDialog(
        title: Text('Select Date'),
        content: Container(
          height: 300,
          width: 300,
          child: CalendarDatePicker(
            initialDate: currentDate,
            firstDate: DateTime.now(),
            lastDate: DateTime.now().add(Duration(days: 365)),
            onDateChanged: (DateTime date) {
              Get.back(result: date);
            },
          ),
        ),
        actions: [
          TextButton(onPressed: () => Get.back(), child: Text('Cancel')),
        ],
      ),
    );

    if (pickedDate != null && pickedDate != currentDate) {
      updateTaskDate(taskId, pickedDate);
    }
  }
}
