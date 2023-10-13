import 'package:get/get.dart';
import 'package:transisi_test_app/src/app/data/models/user_model.dart';
import 'package:transisi_test_app/src/app/data/provider/provider.dart';

class DashboardController extends GetxController {
  Provider provider = Provider();
  int totalPage = 0;
  int currentPage = 1;
  List<User> users = [];
  RxBool isLoadMoreVisible = false.obs;
  RxBool isProcessing = false.obs;
  RxList<User> foundUsers = <User>[].obs;
  @override
  void onInit() {
    super.onInit();
    getUserList();
  }

  void getUserList() async {
    isProcessing.value = true;
    var response = await provider.getUserList(currentPage);
    List<Map<String, dynamic>> listOfUser = List.castFrom(response['data']);

    users
        .addAll(listOfUser.map((dynamic user) => User.fromJson(user)).toList());
    totalPage = response['total_pages'];

    if (currentPage < totalPage) {
      isLoadMoreVisible.value = true;
    } else {
      isLoadMoreVisible.value = false;
    }

    await Future.delayed(const Duration(milliseconds: 1000));
    isProcessing.value = false;
  }

  void searchUser(String text) {
    if (text.isEmpty) {
      foundUsers.value = <User>[];
    } else if (text.length > 1) {
      foundUsers.value = users
          .where((user) =>
              user.firstName.contains(text) || user.lastName.contains(text))
          .toList();
    }
  }
}
