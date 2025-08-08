import 'package:get/get.dart';
import '../controllers/task_controller.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<TaskController>(TaskController(), permanent: true);
  }
}
