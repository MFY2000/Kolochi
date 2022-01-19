// ignore_for_file: file_names

import 'package:fb_login_app/Components/Custom/Alert/AlertBox1.dart';
import 'package:flutter/material.dart';
import 'package:fb_login_app/Components/Custom/Button/ButtonColored.dart';
import 'package:fb_login_app/Components/Custom/TextFeild/TextFeild_1.dart';
import 'package:fb_login_app/Config/size_config.dart';
import 'package:fb_login_app/Model/ModelClasses.dart';
import 'package:fb_login_app/Model/ModelFactory.dart';
import 'package:fb_login_app/Model/TextFeildModel.dart';
import 'package:fb_login_app/Pages/Profile/Address/AddressScreen.dart';

class CreateAddress extends StatefulWidget {
  const CreateAddress({Key? key}) : super(key: key);

  @override
  _CreateAddressState createState() => _CreateAddressState();
}

class _CreateAddressState extends State<CreateAddress> {
  CreateAddressModel newAddressModel = CreateAddressModel(currentUser.name);

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
                "Create Address",
                style: Theme.of(context).textTheme.headline2,
              ),
              SizedBox(
                height: getSize(true, .075),
              ),
              Column(
                children: [
                  TextFeild1(
                    reference: newAddressModel.name,
                  ),
                  TextFeild1(
                    reference: newAddressModel.address,
                  ),
                  TextFeild1(
                    reference: newAddressModel.city,
                  ),
                  TextFeild1(
                    reference: newAddressModel.postal,
                  ),
                  TextFeild1(
                    reference: newAddressModel.phone,
                  ),
                ],
              ),
              SizedBox(
                height: getSize(true, .075),
              ),
              ButtonColored(
                function: addAddress,
                text: "Add Address",
              )
            ],
          ),
        ),
      ),
    );
  }

  addAddress() {
    if (validation()) {
      currentUser.addNewAddress(newAddressModel.name.control.text, newAddressModel.address.control.text,
          newAddressModel.city.control.text, newAddressModel.postal.control.text, newAddressModel.phone.control.text);

      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const AddressScreen()),(route) => false);

    } else {
      alertBox1(context, "Error", "Error");
    }
  }

  bool validation() {
    bool isValid = true;

    if (getTextFromFeild(newAddressModel.name)) {
      setState(() {
        isValid = false;
        newAddressModel.name.isError = true;
        newAddressModel.name.errorMessage = "Pls fill Name Feild.";
      });
    }
    if (getTextFromFeild(newAddressModel.address)) {
      setState(() {
        isValid = false;
        newAddressModel.address.isError = true;
        newAddressModel.address.errorMessage = "Pls fill Address Feild.";
      });
    }
    if (getTextFromFeild(newAddressModel.city)) {
      isValid = false;
      newAddressModel.city.isError = true;
      newAddressModel.city.errorMessage = "Pls fill City Feild.";
    }
    if (getTextFromFeild(newAddressModel.postal)) {
      isValid = false;
      newAddressModel.postal.isError = true;
      newAddressModel.postal.errorMessage = "Pls fill Postal Code Feild.";
    }
    if (getTextFromFeild(newAddressModel.phone)) {
      isValid = false;
      newAddressModel.phone.isError = true;
      newAddressModel.phone.errorMessage = "Pls fill Phone Number Feild.";
    }

    return isValid;
  }

  getTextFromFeild(TextFeildModel feild) {
    return feild.control.value.text.isEmpty;
  }
}
