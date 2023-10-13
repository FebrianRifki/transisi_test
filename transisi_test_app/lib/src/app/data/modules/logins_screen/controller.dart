import 'package:get/get.dart';
import 'package:transisi_test_app/src/app/data/modules/dashboard_screen/views.dart';
import 'package:transisi_test_app/src/app/data/provider/provider.dart';

class LoginController extends GetxController {
  RxBool isProcessing = false.obs;
  RxBool isSuccessLogin = false.obs;
  RxBool isFailedLogin = false.obs;
  String? token;
  Provider provider = Provider();

  login(email, password) async {
    isProcessing.value = true;
    Map<String, dynamic> body = {"email": email, "password": password};
    Map<String, dynamic> response = await provider.login(body);

    if (response.isNotEmpty) {
      isProcessing.value = false;
      token = response['token'];
      isSuccessLogin.value = true;
      await Future.delayed(const Duration(milliseconds: 4000));
      Get.to(() => const DashboardScreen());
      isSuccessLogin.value = false;
    } else {
      isProcessing.value = false;
      isFailedLogin.value = true;
      await Future.delayed(const Duration(milliseconds: 4000));
      isFailedLogin.value = false;
      print('something went wrong');
    }
  }
}
