import 'package:fb_login_app/Components/AppBar/Bottom/BottomAppBar.dart';
import 'package:fb_login_app/Components/AppBar/Bottom/FloatingButton.dart';
import 'package:fb_login_app/Components/AppBar/Top/AppBar.dart';
import 'package:fb_login_app/Config/constants.dart';
import 'package:fb_login_app/Config/size_config.dart';
import 'package:fb_login_app/Pages/Home/Components/HomeBody.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        appBar: getTopAppbar(),
        body: HomeBody(),
        bottomNavigationBar: BottomNavBar(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingButton(
          isHome: true,
        ));
  }
}
