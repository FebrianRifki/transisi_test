import 'package:flutter/material.dart';

class DetailWidgetCard extends StatelessWidget {
  const DetailWidgetCard(
      {super.key,
      required this.mainText,
      required this.labelText,
      required this.icon,
      this.isHasMessageIcon = false});
  final String mainText;
  final String labelText;
  final Icon icon;
  final bool? isHasMessageIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0, 2),
              blurRadius: 4,
              spreadRadius: 0,
            )
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              icon,
              const SizedBox(
                width: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(mainText),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    " $labelText",
                    style: const TextStyle(color: Colors.grey, fontSize: 12),
                  )
                ],
              ),
            ],
          ),
          isHasMessageIcon!
              ? const Icon(
                  Icons.message,
                  color: Colors.grey,
                )
              : Container()
        ],
      ),
    );
  }
}
