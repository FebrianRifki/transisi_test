import 'package:flutter/material.dart';
import 'package:transisi_test_app/src/app/common_widget/detail_widget_card.dart';
import 'package:transisi_test_app/src/app/data/models/user_model.dart';
import 'package:transisi_test_app/src/app/util/constant/color.dart';

class DetailUserScreen extends StatelessWidget {
  const DetailUserScreen({super.key, required this.user});
  final User user;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Column(
            children: [
              Container(
                  height: height * 0.4,
                  decoration: const BoxDecoration(
                    color: primaryColor,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: Row(children: [
                          IconButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              icon: const Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                                size: 20,
                              )),
                          const Spacer(),
                          Row(
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.star_border_outlined,
                                    color: Colors.white,
                                  )),
                              const SizedBox(
                                width: 10,
                              ),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.edit,
                                    color: Colors.white,
                                  ))
                            ],
                          )
                        ]),
                      ),
                      CircleAvatar(
                        radius: height * 0.1,
                        backgroundColor: Colors.transparent,
                        backgroundImage: NetworkImage(user.avatar),
                      ),
                      Text(
                        "${user.firstName} ${user.lastName}",
                        style: TextStyle(
                            color: Colors.white, fontSize: height * 0.04),
                      )
                    ],
                  )),
              Padding(
                padding:
                    const EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
                child: Column(
                  children: [
                    const DetailWidgetCard(
                      mainText: "(999)-99999-99",
                      labelText: "Phone Number",
                      icon: Icon(
                        Icons.phone,
                        color: primaryColor,
                      ),
                      isHasMessageIcon: true,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    DetailWidgetCard(
                      mainText: user.email,
                      labelText: "E-mail",
                      icon: const Icon(
                        Icons.email,
                        color: primaryColor,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const DetailWidgetCard(
                      mainText: "Share Contact",
                      labelText: "Share",
                      icon: Icon(
                        Icons.share,
                        color: primaryColor,
                      ),
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}
