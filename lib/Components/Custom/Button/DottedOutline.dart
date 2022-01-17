import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:fb_login_app/Config/constants.dart';
import 'package:fb_login_app/Config/size_config.dart';

class DottedOutline extends StatelessWidget {
  final void Function() function;
  final String text;
  const DottedOutline({Key? key, required this.function, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: function,
        child: DottedBorder(
          color: kPrimaryColor,
          strokeWidth: 1,
          child: Container(
            color: kPrimaryLightColor,
            height: getSize(false, 0.06),
            alignment: Alignment.center,
            child: Text(
              text,
              style: const TextStyle(color: kPrimaryColor),
            ),
          ),
        ));
  }
}
