// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:fb_login_app/Config/constants.dart';
import 'package:fb_login_app/Config/size_config.dart';

class HeaderHeading extends StatelessWidget {
  final String heading;
  const HeaderHeading({Key? key, required this.heading}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: getSize(false, 0.025)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            heading,
            style: Theme.of(context).textTheme.headline2,
          ),
          TextButton(
              onPressed: () {},
              child: const Text("See all",
                  style: TextStyle(
                    color: khighLightColor,
                    fontSize: 16
                  ))),
        ],
      ),
    );
  }
}
