import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transisi_test_app/src/app/common_widget/user_shimmer.dart';
import 'package:transisi_test_app/src/app/common_widget/user_widget.dart';
import 'package:transisi_test_app/src/app/data/modules/create_user_screen/views.dart';
import 'package:transisi_test_app/src/app/data/modules/dashboard_screen/controller.dart';
import 'package:transisi_test_app/src/app/data/modules/detail_user_screen/view.dart';
import 'package:transisi_test_app/src/app/util/constant/color.dart';
import 'package:transisi_test_app/src/app/util/debouncer.dart';

class DashboardScreen extends GetView<DashboardController> {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchController = TextEditingController();
    final Debouncer debouncer = Debouncer(milliseconds: 500);
    final controller = Get.put(DashboardController());
    return SafeArea(
      child: Scaffold(
        floatingActionButton: Container(
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 3, 66, 117),
            shape: BoxShape.circle,
          ),
          child: IconButton(
            onPressed: () {
              Get.to(() => const CreateUserScreen());
            },
            icon: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ),
        body: ListView(
          children: [
            Container(
              color: const Color.fromARGB(255, 3, 66, 117),
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: TextField(
                  onChanged: ((value) {
                    debouncer.run(() {
                      controller.searchUser(searchController.text);
                    });
                  }),
                  style: const TextStyle(color: Colors.white),
                  controller: searchController,
                  decoration: const InputDecoration(
                    focusedBorder: InputBorder.none,
                    suffixIcon: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    hintText: 'Search',
                    hintStyle: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            Obx(() {
              if (controller.foundUsers.isNotEmpty) {
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.foundUsers.length,
                  itemBuilder: (context, index) {
                    final user = controller.foundUsers[index];
                    return GestureDetector(
                        onTap: () => Get.to(() => DetailUserScreen(user: user)),
                        child: UserWidget(user: user));
                  },
                );
              } else {
                if (controller.isProcessing.isTrue) {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return const UserShimmer();
                    },
                  );
                } else {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.users.length,
                    itemBuilder: (context, index) {
                      final user = controller.users[index];
                      return GestureDetector(
                          onTap: () =>
                              Get.to(() => DetailUserScreen(user: user)),
                          child: UserWidget(user: user));
                    },
                  );
                }
              }
            }),
            Obx(() {
              return Visibility(
                visible: controller.isLoadMoreVisible.value &&
                    controller.foundUsers.isEmpty,
                child: Padding(
                  padding: const EdgeInsets.only(right: 10.0, left: 10.0),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(primaryColor),
                    ),
                    onPressed: () {
                      if (controller.currentPage < controller.totalPage) {
                        controller.currentPage++;
                        controller.getUserList();
                      }
                    },
                    child: const Text('Load More'),
                  ),
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}
