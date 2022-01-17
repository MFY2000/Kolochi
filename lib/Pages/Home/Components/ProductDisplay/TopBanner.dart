import 'package:flutter/material.dart';
import 'package:fb_login_app/Components/Custom/Cards/Product/ProductCard_1.dart';
import 'package:fb_login_app/Config/size_config.dart';
import 'package:fb_login_app/Model/ModelFactory.dart';

class TopBanner extends StatefulWidget {
  const TopBanner({Key? key}) : super(key: key);

  @override
  _TopBannerState createState() => _TopBannerState();
}

class _TopBannerState extends State<TopBanner> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: getSize(false, .34),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: topPromoList.length,
          itemBuilder: (context, index) {
            return Container(
                margin: EdgeInsets.symmetric(horizontal: getSize(false, .005)),
                child: ProductCard_1(item: topPromoList[index]));
          }),
    );
  }
}
