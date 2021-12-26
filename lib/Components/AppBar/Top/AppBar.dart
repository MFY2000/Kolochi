import 'package:flutter/material.dart';

PreferredSizeWidget getTopAppbar() {
  return AppBar(
    leading: IconButton(
      icon: Image.asset("assets/images/icons/MenuBar.png"),
      onPressed: () => {},
    ),
  );
}
