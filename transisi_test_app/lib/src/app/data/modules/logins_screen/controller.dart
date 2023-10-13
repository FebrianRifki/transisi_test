import 'package:get/get.dart';
import 'package:transisi_test_app/src/app/data/modules/dashboard_screen/views.dart';
import 'package:transisi_test_app/src/app/data/provider/provider.dart';

class LoginController extends GetxController {
  RxBool isProcessing = false.obs;
  RxBool isSuccessLogin = false.obs;
  RxBool isFailedLogin = false.obs;
  String? token;
  String isFailedLoginMessage = '';
  Provider provider = Provider();
  RxBool isErrorUsername = false.obs;
  RxBool isErrorPassword = false.obs;

  validateUserName(value) {
    if (value.isEmpty) {
      isErrorUsername.value = true;
      return 'Username is required';
    } else {
      isErrorUsername.value = false;
      return null;
    }
  }

  validatePassword(value) {
    if (value.isEmpty) {
      isErrorPassword.value = true;
      return 'Password is required';
    } else {
      isErrorPassword.value = false;
      return null;
    }
  }

  login(email, password) async {
    isProcessing.value = true;
    Map<String, dynamic> body = {"email": email, "password": password};
    try {
      Map<String, dynamic> response = await provider.login(body);
      if (response.containsKey('error')) {
        isProcessing.value = false;
        isFailedLogin.value = true;
        await Future.delayed(const Duration(milliseconds: 4000));
        isFailedLogin.value = false;
        print('something went wrong');
      } else {
        isProcessing.value = false;
        token = response['token'];
        isSuccessLogin.value = true;
        await Future.delayed(const Duration(milliseconds: 4000));
        Get.offAll(() => const DashboardScreen());
        isSuccessLogin.value = false;
      }
    } catch (e) {}
  }
}
