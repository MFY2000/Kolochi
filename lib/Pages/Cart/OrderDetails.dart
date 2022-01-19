// ignore_for_file: file_names

import 'package:fb_login_app/API/API_Route.dart';
import 'package:fb_login_app/API/getApi.dart';
import 'package:fb_login_app/Model/ModelClasses.dart';
import 'package:fb_login_app/Pages/Cart/CartDetails.dart';
import 'package:flutter/material.dart';
import 'package:fb_login_app/Components/Custom/Button/ButtonColored.dart';
import 'package:fb_login_app/Components/Custom/Cards/Cart/CartCard.dart';
import 'package:fb_login_app/Config/size_config.dart';
import 'package:fb_login_app/Model/ModelFactory.dart';
import 'package:fb_login_app/Pages/Details/ProductDetails.dart';
import 'package:fb_login_app/Pages/Profile/Address/AddressScreen.dart';
import 'package:fb_login_app/Pages/Profile/Address/CreateAddress.dart';

class OrderDetailsScreen extends StatefulWidget {
  const OrderDetailsScreen({Key? key}) : super(key: key);

  @override
  OrderDetailsScreenState createState() => OrderDetailsScreenState();
}

class OrderDetailsScreenState extends State<OrderDetailsScreen> {
  List<CartsDetailsModel> orders = [];
  bool isDataRecive = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getOrders();
  }

  getOrders() async {
    var data = await getApi(api_GET_Orders + currentUser.id);

    if (data != null) {
      CartsDetailsModel temp;
      for (var iData in data) {
      print(iData);
        for (var item in iData["products"]) {
          temp = CartsDetailsModel(
              item["productId"], item["quantity"], item["size"], item["color"]);
          temp.subTitle = iData["status"];
          orders.add(temp);
        }
      }
    }
    print("fewwfrr");
    setState(() {
      isDataRecive = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isDataRecive
        ? SingleChildScrollView(
          child: Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(
                  vertical: getSize(false, .025), horizontal: getSize(true, .05)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Ny Order",
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  SizedBox(
                    height: getSize(true, .075),
                  ),
                  orders.isNotEmpty
                      ? ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: orders.length,
                          itemBuilder: (context, index) => CartCard(
                              item: orders[index],
                              onCounterChange: (int count) {},
                              onRemove: () => {},
                              onClick: () => {}),
                        )
                      : const Text("No Item in the cart."),
                ],
              ),
            ),
        )
        : const Center(
            child: CircularProgressIndicator(),
          );
  }
}
