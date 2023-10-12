import 'package:flutter/material.dart';
import 'package:transisi_test_app/src/app/common_widget/detail_widget_card.dart';
import 'package:transisi_test_app/src/app/util/constant/color.dart';

class DetailUserScreen extends StatelessWidget {
  const DetailUserScreen({super.key});

  @override
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
                    color: prymaryColor,
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
                      Icon(
                        Icons.person,
                        color: Colors.white,
                        size: height * 0.2,
                      ),
                      Text(
                        'Laterna verde',
                        style: TextStyle(
                            color: Colors.white, fontSize: height * 0.04),
                      )
                    ],
                  )),
              const Padding(
                padding: EdgeInsets.only(top: 20.0, left: 10.0, right: 10.0),
                child: Column(
                  children: [
                    DetailWidgetCard(
                      mainText: "(999)-99999-99",
                      labelText: "Phone Number",
                      icon: Icon(
                        Icons.phone,
                        color: prymaryColor,
                      ),
                      isHasMessageIcon: true,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    DetailWidgetCard(
                      mainText: "lanterna@ligadajustica@gmail.com",
                      labelText: "E-mail",
                      icon: Icon(
                        Icons.email,
                        color: prymaryColor,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    DetailWidgetCard(
                      mainText: "Share Contact",
                      labelText: "Share",
                      icon: Icon(
                        Icons.share,
                        color: prymaryColor,
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
