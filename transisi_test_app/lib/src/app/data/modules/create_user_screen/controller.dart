import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:transisi_test_app/src/app/data/provider/provider.dart';

class CreateUserController extends GetxController {
  final ImagePicker picker = ImagePicker();
  XFile? image;
  Rx<File?> imageFile = Rx<File?>(null);
  Provider provider = Provider();
  RxBool isProcessing = true.obs;
  RxBool isSuccess = false.obs;
  RxBool isFailed = false.obs;

  void selectImage() async {
    var image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      imageFile.value = File(image.path);
    }
  }

  createUser(username, job) async {
    isProcessing.value = true;
    isSuccess.value = false;
    isFailed.value = false;
    Map<String, dynamic> body = {'name': username, 'job': job};
    var res = await provider.createUser(body);
    if (res) {
      print(res);
      isSuccess.value = res;
      isProcessing.value = false;
    } else {
      print(res);
      isFailed.value = res;
      isProcessing.value = false;
    }
  }
}
