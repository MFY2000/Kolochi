import 'package:fb_login_app/Components/AppBar/Top/AppBar.dart';
import 'package:fb_login_app/Pages/Cart/CartDetails.dart';
import 'package:fb_login_app/Pages/Favourite/FavouriteScreen.dart';
import 'package:fb_login_app/Pages/Home/Components/HomeBody.dart';
import 'package:fb_login_app/Pages/Home/Profile.dart';
import 'package:fb_login_app/Services/Auth.dart';
import 'package:flutter/material.dart';
import 'package:fb_login_app/Config/constants.dart';
import 'package:fb_login_app/Config/size_config.dart';
import 'package:fb_login_app/Model/ModelFactory.dart';

class CustomDrawer extends StatelessWidget {
  final int index;
  const CustomDrawer({Key? key, required this.index}) : super(key: key);

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
            getNavItem(context, Icons.home_outlined, 'Home', HomeBody(), 2),
            getNavItem(context, Icons.person_outline, 'Profile', Profile(), 4),
            getNavItem(context, Icons.shopping_bag_outlined, 'My Cart',
                CartDetails(), index),
            Container(
              decoration: const BoxDecoration(
                  border: Border(
                bottom: BorderSide(width: 1, color: kPrimaryLightColor),
              )),
            ),
            getNavItem(context, Icons.favorite_border, 'Favourites',
                FavouriteScreen(), index),
            getNavItem(context, Icons.shopping_cart_outlined, 'My Order',
                Container(), index),
            Container(
              decoration: const BoxDecoration(
                  border: Border(
                bottom: BorderSide(width: 1, color: kPrimaryLightColor),
              )),
            ),
            getNavItem(context, Icons.euro_symbol, 'Language', Container(), index),
            getNavItem(
                context, Icons.settings_outlined, 'Settings', Container(), index),
            InkWell(
              onTap: () async {
                await AuthClass().signOut(context: context);
              },
              child: Container(
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
            ),
            Spacer(),
            DefaultTextStyle(
              style: const TextStyle(
                fontSize: 10,
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

  toGoPath(BuildContext context, Widget screen) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => screen));
  }

  getNavItem(BuildContext context, IconData icon, String name, Widget screen,
      int index) {
    return ListTile(
      onTap: () => toGoPath(context, TopAppBar(body: screen, index: index)),
      leading: Icon(icon, size: kiconSize),
      title: Text(name),
    );
  }
}
