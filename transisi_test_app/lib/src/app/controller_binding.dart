import 'package:get/get.dart';
import 'package:transisi_test_app/src/app/data/modules/create_user_screen/controller.dart';
import 'package:transisi_test_app/src/app/data/modules/dashboard_screen/controller.dart';
import 'package:transisi_test_app/src/app/data/modules/logins_screen/controller.dart';

class ControllerBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
    Get.lazyPut(() => DashboardController());
    Get.lazyPut(() => CreateUserController());
  }
}
