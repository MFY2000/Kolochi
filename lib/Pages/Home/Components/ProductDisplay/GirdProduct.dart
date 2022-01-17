import 'package:flutter/material.dart';
import 'package:fb_login_app/Components/Custom/Cards/Product/ProductCard_2.dart';
import 'package:fb_login_app/Components/Custom/Function/FunctionFactory.dart';
import 'package:fb_login_app/Config/size_config.dart';
import 'package:fb_login_app/Model/ModelFactory.dart';

class GirdProduct extends StatefulWidget {
  const GirdProduct({Key? key}) : super(key: key);

  @override
  _GirdProductState createState() => _GirdProductState();
}

class _GirdProductState extends State<GirdProduct> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: productsList.length < 5 ? productsList.length : 5,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: (.63),
          crossAxisCount: 2,
        ),
        itemBuilder: (BuildContext context, int index) {
          return SizedBox(
              height: getSize(false, .35),
              child: ProductCard_2(
                  item: productsList[index],
                  onFavourite: () {
                    addToFavourite(index, productsList[index].isFavourite);
                  }));
        });
  }

  addToFavourite(int index, bool condition) {
    setState(() {
      favourite(index, condition);
    });
  }
}
