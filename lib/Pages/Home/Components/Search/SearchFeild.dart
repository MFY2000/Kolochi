import 'package:fb_login_app/Config/constants.dart';
import 'package:flutter/material.dart';
import 'package:fb_login_app/Config/size_config.dart';

class SearchFeild extends StatelessWidget {
  final onChange;
  const SearchFeild({Key? key,required this.onChange}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: kPrimaryLightColor,
          borderRadius: BorderRadius.circular(100),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.25),
              spreadRadius: 1,
              blurRadius: 10,
              offset: const Offset(0, 14),
            ),
          ]),
      margin: EdgeInsets.symmetric(
          vertical: getSize(false, 0.025), horizontal: getSize(true, 0.015)),
      child: Container(
        width: getSize(false, 0.4),
        height: getSize(true, 0.15),
        child: TextField(
          controller: TextEditingController(),
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.search),
            hintText: "| Search",
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
          ),
          onChanged: onChange,
        ),
      ),
    );
  }
}
