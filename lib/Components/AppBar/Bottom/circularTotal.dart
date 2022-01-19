// ignore_for_file: file_names

import 'package:fb_login_app/Config/constants.dart';
import 'package:flutter/material.dart';

class circularTotal extends StatelessWidget {
  final int index;
  final Widget main;
  const circularTotal({Key? key, required this.index, required this.main})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
            top: 5,
            right: 5,
            child: CircleAvatar(
              backgroundColor: kPrimaryColor2,
              child: Text(
                "$index",
                style: const TextStyle(fontSize: 10, color: khighLightColor),
              ),
            )),
        Expanded(child: main)
      ],
    );
  }
}
