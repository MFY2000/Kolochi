// ignore_for_file: file_names

import 'package:fb_login_app/Components/Custom/Cards/AddressCard.dart';
import 'package:fb_login_app/Pages/Home/Profile.dart';
import 'package:fb_login_app/Pages/Profile/Address/AddressScreen.dart';
import 'package:fb_login_app/Pages/Profile/Address/CreateAddress.dart';
import 'package:fb_login_app/Pages/Profile/Payment/PaymentScreen.dart';
import 'package:fb_login_app/Services/Auth.dart';
import 'package:flutter/material.dart';
import 'package:fb_login_app/Components/Custom/Button/ButtonColored.dart';
import 'package:fb_login_app/Components/Custom/Button/DottedOutline.dart';
import 'package:fb_login_app/Config/constants.dart';
import 'package:fb_login_app/Config/size_config.dart';
import 'package:fb_login_app/Config/theme.dart';
import 'package:fb_login_app/Pages/Profile/Payment/Components/CalculatorTaxTable.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isEdit = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                "Profile",
                style: Theme.of(context).textTheme.headline2,
              ),
              SizedBox(
                height: getSize(true, .075),
              ),
              ListTile(
                onTap: () => togo(Profile()),
                title: Text('Information'),
              ),
              ListTile(
                onTap: () => togo(AddressScreen()),
                title: Text('Address'),
              ),
              ListTile(
                onTap: () => togo(CreateAddress()),
                title: Text('Add New Address'),
              ),
              ListTile(
                onTap: () => togo(PaymentScreen()),
                title: Text('Payment'),
              ),
              ListTile(
                onTap: () {},
                title: Text('Language'),
              ),
              ListTile(
                onTap: () {},
                title: Text('Settings'),
              ),
              InkWell(
                onTap: () async {
                  await AuthClass().signOut(context: context);
                },
                child: Container(
                  alignment: Alignment.center,
                  width: getSize(true, 0.4),
                  padding: EdgeInsets.all(getSize(true, 0.025)),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: kPrimaryColor, width: 2)),
                  child: const Text(
                    "Logout",
                    style: TextStyle(color: kPrimaryColor),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  onEditClick() {
    setState(() {
      isEdit = false;
    });
  }

  onSaveClick() {
    setState(() {
      isEdit = true;
    });
  }

  togo(Widget screen) {
    Navigator.push(
        context, MaterialPageRoute(builder: (BuildContext context) => screen));
  }
}
