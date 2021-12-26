import 'package:fb_login_app/Config/size_config.dart';
import 'package:flutter/material.dart';

class ProductCard_1 extends StatelessWidget {
  const ProductCard_1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: getSize(false, 0.32),
      width: getSize(true, 0.45),
      child: Card(
        child: Column(
          children: [
            Container(
              height: getSize(false, 0.225),
              color: Colors.black,
            ),
            Row(
              children: [
                for (var i = 0; i < 5; i++) 
                  Icon(Icons.star)
              ],

            ),
              Text("height: getSize(false, 0.3),")
          ],
        ),
      ),
    );
  }
}
