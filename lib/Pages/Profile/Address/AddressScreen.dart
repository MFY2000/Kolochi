// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:fb_login_app/Components/Custom/Button/ButtonColored.dart';
import 'package:fb_login_app/Components/Custom/Button/DottedOutline.dart';
import 'package:fb_login_app/Components/Custom/Cards/AddressCard.dart';
import 'package:fb_login_app/Config/size_config.dart';
import 'package:fb_login_app/Model/ModelFactory.dart';
import 'package:fb_login_app/Pages/Cart/Checkout.dart';
import 'package:fb_login_app/Pages/Profile/Address/CreateAddress.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({Key? key}) : super(key: key);

  @override
  _AddressScreenState createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  int selectedIndex = 10000;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
                "Address",
                style: Theme.of(context).textTheme.headline2,
              ),
              SizedBox(
                height: getSize(true, .075),
              ),
              SizedBox(
                height: getSize(false, 0.6),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: currentUser.address.length,
                  itemBuilder: (context, index) => AddressCard(
                      data: currentUser.address[index],
                      group: selectedIndex,
                      onSelect: selectedIndexChange,
                      index: index),
                ),
              ),
              DottedOutline(
                function: () => toGo(CreateAddress()),
                text: "Add Address",
              ),
              SizedBox(
                height: getSize(false, .0125),
              ),
              ButtonColored(
                function: () => toGo(Checkout()),
                text: "Continue To Payment",
              )
            ],
          ),
        ),
      ),
    );
  }

  selectedIndexChange(int index) {
    setState(() {
      selectedIndex = index;
      orderDetails.selectedAddress = currentUser.address[index]; 
    });
  }

  toGo(Widget path){
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => path),
    );
  }
}
