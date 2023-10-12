import 'package:get/get.dart';
import 'package:transisi_test_app/src/app/data/modules/logins_screen/controller.dart';

class ControllerBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }
}
