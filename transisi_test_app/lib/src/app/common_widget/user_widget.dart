import 'package:flutter/material.dart';
import 'package:transisi_test_app/src/app/data/models/user_model.dart';
import 'package:transisi_test_app/src/app/util/constant/color.dart';

class UserWidget extends StatefulWidget {
  const UserWidget({super.key, required this.user});

  final User user;

  @override
  State<UserWidget> createState() => _UserWidgetState();
}

class _UserWidgetState extends State<UserWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 30.0,
                backgroundImage: NetworkImage(widget.user.avatar),
                backgroundColor: Colors.transparent,
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${widget.user.firstName} ${widget.user.lastName}'),
                  const Text('(999) 99999-9999')
                ],
              ),
            ],
          ),
          IconButton(
              onPressed: () {
                setState(() {
                  if (widget.user.isFavorite) {
                    widget.user.isFavorite = false;
                  } else {
                    widget.user.isFavorite = true;
                  }
                });
              },
              icon: widget.user.isFavorite
                  ? const Icon(
                      Icons.star,
                      color: primaryColor,
                    )
                  : const Icon(
                      Icons.star_border_outlined,
                      color: primaryColor,
                    ))
        ],
      ),
    );
  }
}
