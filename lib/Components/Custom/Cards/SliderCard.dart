import 'package:fb_login_app/Components/Custom/Button/ButtonColored.dart';
import 'package:fb_login_app/Config/size_config.dart';
import 'package:flutter/material.dart';

class SliderCard extends StatelessWidget {
  const SliderCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: getSize(false, .215),
        width: getSize(true, .91785),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.all(4),
              width: getSize(true, .25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hallowen",
                  ),
                  Text(
                    "HallowenHallowenHallowenHallowen",
                  ),
                  Container(child: Text("Button")),
                ],
              ),
            ),
            Container(
              height: getSize(false, .215),
              child: Image.asset(
                "assets/images/Smaple.png",
                fit: BoxFit.fill,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
