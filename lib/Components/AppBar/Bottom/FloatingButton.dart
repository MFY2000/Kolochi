import 'package:fb_login_app/Config/constants.dart';
import 'package:fb_login_app/Config/size_config.dart';
import 'package:flutter/material.dart';

class FloatingButton extends StatelessWidget {
  final bool isHome;
  const FloatingButton({Key? key, required this.isHome}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getSize(false, 0.185),
      width: getSize(true, 0.185),
      child: FloatingActionButton(
        child: Icon(
          Icons.home_outlined,
          size: kiconSize + 15,
          color: isHome ? kPrimaryColor : kSecondaryColor,
        ),
        elevation: 10,
        onPressed: () {},
      ),
    );
  }
}
