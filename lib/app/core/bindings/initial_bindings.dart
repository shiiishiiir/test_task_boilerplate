import 'package:get/get.dart';
import 'package:task_test/app/modules/home/bindings/home_binding.dart';

import '../../services/connection_manager/connection_manager_controller.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ConnectionManagerController>(() => ConnectionManagerController());
    HomeBinding().dependencies();
  }
}