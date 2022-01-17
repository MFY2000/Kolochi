// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:fb_login_app/Config/constants.dart';

class IconButtonCustome extends StatelessWidget {
  final function;
  final String text;
  final IconData icon;
  const IconButtonCustome({
    Key? key,
    required this.function,
    required this.text,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: Row(
        children: [
          Text(text, style: Theme.of(context).textTheme.headline3,),
          Icon(icon, color: khighLightColor, size: 16,),
        ],
      ),
    );
  }
}
