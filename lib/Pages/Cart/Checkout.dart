import 'package:flutter/material.dart';
import 'package:fb_login_app/Components/AppBar/Bottom/BottomAppBar2.dart';
import 'package:fb_login_app/Components/Custom/Button/ButtonColored.dart';
import 'package:fb_login_app/Components/Custom/Cards/AddressCard.dart';
import 'package:fb_login_app/Components/Custom/Cards/Cart/CartCard.dart';
import 'package:fb_login_app/Config/size_config.dart';
import 'package:fb_login_app/Config/theme.dart';
import 'package:fb_login_app/Model/ModelClasses.dart';
import 'package:fb_login_app/Model/ModelFactory.dart';
import 'package:fb_login_app/Pages/Confirmation/Confirmation.dart';
import 'package:fb_login_app/Pages/Profile/Payment/Components/CalculatorTaxTable.dart';

class Checkout extends StatefulWidget {
  const Checkout({Key? key}) : super(key: key);

  @override
  _CheckoutState createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: const BottomAppBar2(currentIndex: 0,),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.symmetric(
              vertical: getSize(false, .025), horizontal: getSize(true, .05)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Checkout",
                style: Theme.of(context).textTheme.headline2,
              ),
              SizedBox(
                height: getSize(true, .075),
              ),
              SizedBox(
                height: getSize(false, .35),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: orderDetails.orderList.length,
                  itemBuilder: (context, index) => CartCard(
                    item: orderDetails.orderList[index],
                    onCounterChange: () {},
                    onRemove: () {},
                    onClick: () {},
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                height: 1,
              ),
              Center(
                child: AddressCard(
                    data: orderDetails.selectedAddress,
                    group: 0,
                    onSelect: (int i) => {},
                    index: 0),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                height: 1,
                decoration: getBottomBorder(),
              ),
              const CalculatorTaxTable(),
              SizedBox(
                height: getSize(true, .075),
              ),
              ButtonColored(
                function: toGo,
                text: "Buy",
              )
            ],
          ),
        ),
      ),
    );
  }

  toGo() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const Confirmation()));
  }
}
