// ignore_for_file: file_names

import 'package:fb_login_app/Components/Custom/Function/FunctionFactory.dart';
import 'package:fb_login_app/Model/ModelClasses.dart';
import 'package:flutter/material.dart';
import 'package:fb_login_app/Components/Custom/Button/ButtonColored.dart';
import 'package:fb_login_app/Components/Custom/Cards/Cart/CartCard.dart';
import 'package:fb_login_app/Config/size_config.dart';
import 'package:fb_login_app/Model/ModelFactory.dart';
import 'package:fb_login_app/Pages/Details/ProductDetails.dart';
import 'package:fb_login_app/Pages/Profile/Address/AddressScreen.dart';
import 'package:fb_login_app/Pages/Profile/Address/CreateAddress.dart';

class CartDetails extends StatefulWidget {
  const CartDetails({Key? key}) : super(key: key);

  @override
  _CartDetailsState createState() => _CartDetailsState();
}

class _CartDetailsState extends State<CartDetails> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getSize(false, 1),
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(bottom: getSize(false, .1)),
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(
                  vertical: getSize(false, .025),
                  horizontal: getSize(true, .05)),
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
                              onCounterChange: (int count) {
                                counterChane(count, cartList[index].pid);
                              },
                              onRemove: () => removeCart(cartList[index].pid),
                              onClick: () => onProductClick(index)),
                        )
                      : const Text("No Item in the cart."),
                ],
              ),
            ),
          ),
          Positioned(
              bottom: getSize(false, .05),
              right: getSize(true, .05),
              left: getSize(true, .05),
              child: ButtonColored(
                function: toGo,
                text: "Continue",
              ))
        ],
      ),
    );
  }

  onProductClick(int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => ProductDetails(
                details: productsList.firstWhere(
                    (element) => cartList[index].pid == element.pid),
                selected: [
                  cartList[index].selectedColor,
                  cartList[index].selectedColor
                ],
              )),
    );
  }

  removeCart(String index) {
    setState(() {
      cartList.removeWhere((element) => (element.pid == index));
      carts();
    });
  }

  counterChane(int count, String index) {
    for (var item in cartList) {
      if (item.pid == index) {
        item.quantity = count;
      }
    }
    carts();
  }

  toGo() {
    if (cartList.isNotEmpty) {
      orderDetails = OrderDetails();
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => currentUser.address.isNotEmpty
                ? const AddressScreen()
                : const CreateAddress()),
      );
    }
  }
}
