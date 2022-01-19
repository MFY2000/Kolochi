import 'package:flutter/material.dart';
import 'package:fb_login_app/Config/size_config.dart';

class SearchFeild extends StatelessWidget {
  const SearchFeild({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.blue, borderRadius: BorderRadius.circular(100)),
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
        ),
      ),
    );
  }
}
