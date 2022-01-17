import 'package:fb_login_app/Config/constants.dart';
import 'package:fb_login_app/Config/size_config.dart';
import 'package:flutter/material.dart';
import 'package:fb_login_app/Model/SliderPromo.dart';

class SliderCard extends StatelessWidget {
  final SliderPromo item;
  const SliderCard({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        height: getSize(false, .215),
        width: getSize(true, .91785),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: const EdgeInsets.all(4),
              padding: const EdgeInsets.all(4),
              width: getSize(true, .25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Text(
                      item.title,
                      style:
                          const TextStyle(color: khighLightColor, fontSize: 10),
                    ),
                  ),
                  Text(
                    item.subTitle,
                    style: const TextStyle(color: kHeading, fontSize: 12),
                  ),
                  Container(
                      margin: const EdgeInsets.only(top: 18),
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                        gradient: kPrimaryGradientColor,
                      ),
                      child: Text(item.button,
                          style: const TextStyle(
                              color: kPrimaryLightColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w900))),
                ],
              ),
            ),
            SizedBox(
              width: getSize(true, .45),
              height: getSize(false, .215),
              child: item.isAssets
                  ? Image.asset(
                      item.image,
                      fit: BoxFit.fill,
                    )
                  : Image.network(
                      item.image,
                      fit: BoxFit.fill,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
