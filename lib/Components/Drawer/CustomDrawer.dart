import 'package:flutter/material.dart';
import 'package:fb_login_app/Components/Custom/Button/DottedOutline.dart';
import 'package:fb_login_app/Config/constants.dart';
import 'package:fb_login_app/Config/size_config.dart';
import 'package:fb_login_app/Config/theme.dart';
import 'package:fb_login_app/Model/ModelFactory.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      margin: EdgeInsets.only(left: getSize(true, .05)),
      child: ListTileTheme(
        horizontalTitleGap: 0,
        minVerticalPadding: 0,
        contentPadding: EdgeInsets.zero,
        textColor: kPrimaryLightColor,
        iconColor: kPrimaryLightColor,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(
                  top: getSize(true, 0.10), bottom: getSize(true, 0.02)),
              child: CircleAvatar(
                radius: getSize(false, .075),
                backgroundImage: NetworkImage(
                  currentUser.image,
                ),
              ),
            ),
            Container(
                margin: EdgeInsets.only(bottom: getSize(true, 0.05)),
                child: Text(
                  currentUser.name,
                  style: const TextStyle(
                      color: kPrimaryLightColor, fontSize: headingfontSize),
                )),
            ListTile(
              onTap: () {},
              leading: Icon(Icons.home_outlined),
              title: Text('Home'),
            ),
            ListTile(
              onTap: () {},
              leading: Icon(Icons.person_outline),
              title: Text('Profile'),
            ),
            ListTile(
              onTap: () {},
              leading: Icon(Icons.shopping_bag_outlined),
              title: Text('My Cart'),
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border(
                bottom: BorderSide(width: 1, color: kPrimaryLightColor),
              )),
            ),
            ListTile(
              onTap: () {},
              leading: Icon(Icons.favorite_border),
              title: Text('Favourites'),
            ),
            ListTile(
              onTap: () {},
              leading: Icon(Icons.shopping_cart_outlined),
              title: Text('My Order'),
            ),
            Container(
              decoration: const BoxDecoration(
                  border: Border(
                bottom: BorderSide(width: 1, color: kPrimaryLightColor),
              )),
            ),
            ListTile(
              onTap: () {},
              leading: Icon(Icons.euro_symbol),
              title: Text('Language'),
            ),
            ListTile(
              onTap: () {},
              leading: Icon(Icons.settings_outlined),
              title: Text('Settings'),
            ),
            Container(
              alignment: Alignment.center,
              width: getSize(true, 0.2),
              padding: EdgeInsets.all(getSize(true, 0.025)),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: kPrimaryLightColor, width: 2)),
              child: const Text(
                "Logout",
                style: TextStyle(color: kPrimaryLightColor),
              ),
            ),
            Spacer(),
            DefaultTextStyle(
              style: const TextStyle(
                fontSize: fontSize,
                color: kPrimaryLightColor,
              ),
              child: Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 16.0,
                ),
                child: Text('Terms of Service | Privacy Policy'),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
