import 'package:fb_login_app/Components/Custom/Function/FunctionFactory.dart';
import 'package:fb_login_app/Components/Custom/Rating/Rating.dart';
import 'package:fb_login_app/Config/size_config.dart';
import 'package:flutter/material.dart';
import 'package:fb_login_app/Model/ModelClasses.dart';
import 'package:fb_login_app/Pages/Details/ProductDetails.dart';

class ProductCard_1 extends StatelessWidget {
  final ProductModel item;
  const ProductCard_1({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ProductDetails(details: item, selected: cartSelected(item.pid),)),
        );
      },
      child: SizedBox(
        width: getSize(true, 0.425),
        child: Card(
          child: Column(
            children: [
              Container(
                width: getSize(true, 0.425),
                height: getSize(false, 0.25),
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
              Container(
                margin: const EdgeInsets.all(7),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("\$ ${item.price}"),
                        Rating(count: item.rating),
                      ],
                    ),
                    SizedBox(
                      height: getSize(false, 0.0125),
                    ),
                    Text(item.title)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
