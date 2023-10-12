import 'package:get/get.dart';
import 'package:transisi_test_app/src/app/data/provider/provider.dart';
import 'package:transisi_test_app/src/app/controller_binding.dart';

class LoginController extends GetxController {
  RxBool isProcessing = false.obs;
  String? token;
  Provider provider = Provider();
  login(email, password) async {
    Map<String, String> body = {"email": email, "password": password};
    Map<String, dynamic> response = await provider.login(body);
    if (response.isNotEmpty) {
      print('success');
    } else {
      print('something went wrong');
    }
  }
}
