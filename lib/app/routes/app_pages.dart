import 'package:get/get.dart';
import '../modules/task_list/bindings/task_list_binding.dart';
import '../modules/task_list/views/task_list_view.dart';
import 'app_routes.dart';

class AppPages {
  static const INITIAL = AppRoutes.TASK_LIST;

  static final routes = [
    GetPage(
      name: AppRoutes.TASK_LIST,
      page: () => TaskListView(),
      binding: TaskListBinding(),
    ),
  ];
}
