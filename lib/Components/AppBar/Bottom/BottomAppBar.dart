import 'package:fb_login_app/Config/constants.dart';
import 'package:fb_login_app/Pages/Home/HomeScreen.dart';
import 'package:fb_login_app/Pages/Login/Intro/Introduction.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentIndex = 2;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (index) => setState(() => currentIndex = index),
      currentIndex: currentIndex,
      selectedIconTheme: IconThemeData(color: kPrimaryColor),
      unselectedIconTheme: IconThemeData(color: kSecondaryColor),
      elevation: 0,
      selectedFontSize: iconSize,
      unselectedFontSize: iconSize,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      iconSize: kiconSize,
      items: [
        BottomNavigationBarItem(
          icon: IconButton(
            icon: Icon(
              Icons.shopping_bag_outlined,
              size: kiconSize,
            ),
            onPressed: () => {toGoPath(IntroSrceen())},
          ),
          label: 'profile',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.favorite_border,
            size: kiconSize,
          ),
          label: 'home',
        ),
        BottomNavigationBarItem(
          icon: Container(),
          label: 'home',
        ),
        BottomNavigationBarItem(
          icon: IconButton(
            icon: Icon(
              Icons.search_outlined,
              size: kiconSize,
            ),
            onPressed: () => {toGoPath(IntroSrceen())},
          ),
          label: 'search',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.person_outline,
            size: kiconSize,
          ),
          label: 'home',
        ),
      ],
    );
  }

  toGoPath(Widget page) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => page));
  }
}
