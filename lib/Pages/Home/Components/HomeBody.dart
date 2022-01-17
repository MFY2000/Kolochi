import 'package:fb_login_app/Config/size_config.dart';
import 'package:fb_login_app/Pages/Home/Components/ProductDisplay/GirdProduct.dart';
import 'package:fb_login_app/Pages/Home/Components/ProductDisplay/HeaderHeading.dart';
import 'package:fb_login_app/Pages/Home/Components/ProductDisplay/TopBanner.dart';
import 'package:fb_login_app/Pages/Home/Components/Search/SearchFeild.dart';
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
    return SingleChildScrollView(
      child: Column(
        children: [
          SearchFeild(),
          SliderList(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: getSize(true, 0.05)),
            child: Column(
              children: const [
                HeaderHeading(heading: "Featured"),
                TopBanner(),
                HeaderHeading(heading: "Best Sell"),
                GirdProduct(),
              ],
            ),
          ),
          SizedBox(
            height: getSize(false, .1),
          )
        ],
      ),
    );
  }
}
