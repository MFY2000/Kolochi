// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:fb_login_app/Components/Custom/Button/ButtonColored.dart';
import 'package:fb_login_app/Components/Custom/Cards/Cart/CartCard.dart';
import 'package:fb_login_app/Config/size_config.dart';
import 'package:fb_login_app/Model/ModelFactory.dart';
import 'package:fb_login_app/Pages/Details/ProductDetails.dart';
import 'package:fb_login_app/Pages/Profile/Address/AddressScreen.dart';
import 'package:fb_login_app/Pages/Profile/Address/CreateAddress.dart';

class OrderDetails extends StatefulWidget {
  const OrderDetails({Key? key}) : super(key: key);

  @override
  OrderDetailsState createState() => OrderDetailsState();
}

class OrderDetailsState extends State<OrderDetails> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.symmetric(
          vertical: getSize(false, .025), horizontal: getSize(true, .05)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Cart",
            style: Theme.of(context).textTheme.headline2,
          ),
          SizedBox(
            height: getSize(true, .075),
          ),
          cartList.isNotEmpty
              ? ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: cartList.length,
                  itemBuilder: (context, index) => CartCard(
                      item: cartList[index],
                      onCounterChange: (int count) {},
                      onRemove: () => {},
                      onClick: () => {}),
                )
              : const Text("No Item in the cart."),
        ],
      ),
    );
  }
}
