import 'package:flutter/material.dart';
import 'package:fb_login_app/Config/size_config.dart';

class SearchFeild extends StatelessWidget {
  const SearchFeild({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

        padding: EdgeInsets.symmetric(
            vertical: getSize(false, 0.035), horizontal: getSize(true, 0.05)),
        child: TextField(
          controller: TextEditingController(),
          decoration: const InputDecoration(
            hintText: "| Search",
            prefixIcon: Icon(Icons.search),
            border: InputBorder.none,
            // focusedBorder:
            //     UnderlineInputBorder(borderSide: BorderSide.none),
            // enabledBorder:
            //     UnderlineInputBorder(borderSide: BorderSide.none),
          ),
        ));
  }
}
