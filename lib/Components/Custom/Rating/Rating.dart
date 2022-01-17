// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:fb_login_app/Config/constants.dart';

class Rating extends StatelessWidget {
  final num count;
  const Rating({Key? key, required this.count}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (var i = 0; i < count.toInt(); i++)
          const Icon(
            Icons.star,
            color: kPrimaryColor,
            size: 18,
          ),
        if ((count - count.toInt()) == .5)
          const Icon(
            Icons.star_half,
            color: kPrimaryColor,
            size: 18,
          ),
        for (var i = 0; i < (5 - count).toInt(); i++)
          const Icon(
            Icons.star_border,
            color: kPrimaryColor,
            size: 18,
          ),
      ],
    );
  }
}
