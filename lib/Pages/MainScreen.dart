import 'dart:async';

import 'package:fb_login_app/Components/AppBar/Top/AppBar.dart';
import 'package:fb_login_app/Config/size_config.dart';
import 'package:flutter/material.dart';
import 'package:fb_login_app/Model/ModelFactory.dart';
import 'package:fb_login_app/Pages/Home/Components/HomeBody.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool isDataAvailable = false;

  isDataReceive() {
    return productsList.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return dataReceive();
  }

  dataReceive() {
    Timer(const Duration(seconds: 3), isDataReceive() ? () {} : dataReceive);
    return stateChange();
  }

  stateChange() {
    setState(() {});

    if (isDataReceive()) {
      return const TopAppBar(body: HomeBody(), index: 2);
    } else {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }
  }
}
