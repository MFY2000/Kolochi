// ignore_for_file: file_names

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
                onTap: () {},
                title: Text('Information'),
              ),
              ListTile(
                onTap: () {},
                title: Text('Address'),
              ),
              ListTile(
                onTap: () {},
                title: Text('Add New Address'),
              ),
              ListTile(
                onTap: () {},
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
}
