import 'package:fb_login_app/Config/constants.dart';
import 'package:flutter/material.dart';

class SliderIndicate extends StatelessWidget {
  const SliderIndicate({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(4),
      width: 10,
      height: 1,
      color: kPrimaryColor,
    );
  }
}