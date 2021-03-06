// ignore_for_file: file_names

import 'dart:async';

import 'package:fb_login_app/Config/size_config.dart';
import 'package:fb_login_app/Model/ModelFactory.dart';
import 'package:fb_login_app/Pages/Login/Intro/Introduction.dart';
import 'package:fb_login_app/Pages/MainScreen.dart';
import 'package:fb_login_app/Services/Auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  var _visible = true;
  bool isUserLogin = false;

  late AnimationController animationController;
  late Animation<double> animation;
  startTime() async {
    var _duration = const Duration(seconds: 5);
    isUserLogin = FirebaseAuth.instance.currentUser != null;
    return Timer(_duration, navigationPage);
  }

  void navigationPage() async {
    // FirebaseAuth.instance.currentUser!

    isUserLogin ? await getUser(FirebaseAuth.instance.currentUser!.uid) : null;
    Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (BuildContext buildContext) =>
            isUserLogin ? const MainScreen() : const IntroSrceen()));
  }

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    animation =
        CurvedAnimation(parent: animationController, curve: Curves.easeOut);

    animation.addListener(() => setState(() {}));
    animationController.forward();

    setState(() {
      _visible = !_visible;
    });
    getProductData();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Container(
        color: const Color(0XFF303030),
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.only(bottom: 30.0),
                    child: Image.asset(
                      'assets/images/from.png',
                      height: 25.0,
                      fit: BoxFit.scaleDown,
                    ))
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  'assets/images/logo/small_kolachi.png',
                  width: animation.value * 350,
                  height: animation.value * 350,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
