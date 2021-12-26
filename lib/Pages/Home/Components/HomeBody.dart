import 'package:fb_login_app/Components/Custom/Cards/Product/ProductCard_1.dart';
import 'package:fb_login_app/Components/Custom/Cards/SliderCard.dart';
import 'package:fb_login_app/Config/size_config.dart';
import 'package:fb_login_app/Pages/Home/Components/Slider/SliderList.dart';
import 'package:flutter/material.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  _HomeBodyState createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SliderList(),
          ProductCard_1()
        ],
      ),
    );
  }
}
