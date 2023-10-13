import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class UserShimmer extends StatefulWidget {
  const UserShimmer({super.key});

  @override
  State<UserShimmer> createState() => _UserShimmerState();
}

class _UserShimmerState extends State<UserShimmer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              child: Container(
                width: 100.0,
                height: 50.0,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
