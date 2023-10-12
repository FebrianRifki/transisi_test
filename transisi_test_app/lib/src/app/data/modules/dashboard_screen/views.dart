import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:transisi_test_app/src/app/common_widget/user_widget.dart';
import 'package:transisi_test_app/src/app/data/modules/create_user_screen/views.dart';
import 'package:transisi_test_app/src/app/data/modules/detail_user_screen/view.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          floatingActionButton: Container(
            decoration: const BoxDecoration(
                color: Color.fromARGB(255, 3, 66, 117), shape: BoxShape.circle),
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
          body: Column(
            children: [
              Container(
                color: const Color.fromARGB(255, 3, 66, 117),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: TextField(
                    decoration: InputDecoration(
                        focusedBorder: InputBorder.none,
                        suffixIcon: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.search,
                              color: Colors.white,
                            )),
                        hintText: 'Search',
                        hintStyle: const TextStyle(color: Colors.white)),
                  ),
                ),
              ),
              GestureDetector(
                  onTap: () => Get.to(() => const DetailUserScreen()),
                  child: const UserWidget()),
              const UserWidget(),
              const UserWidget(),
              const UserWidget(),
            ],
          )),
    );
  }
}
