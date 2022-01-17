// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:fb_login_app/Components/AppBar/Top/AppBar.dart';
import 'package:fb_login_app/Config/constants.dart';
import 'package:fb_login_app/Pages/Cart/CartDetails.dart';
import 'package:fb_login_app/Pages/Favourite/FavouriteScreen.dart';
import 'package:fb_login_app/Pages/Home/Components/HomeBody.dart';
import 'package:fb_login_app/Pages/Profile/ProfileScreen.dart';
import 'package:fb_login_app/Pages/Search/Search.dart';

class BottomAppBar2 extends StatefulWidget {
  final int currentIndex;
  const BottomAppBar2({Key? key, required this.currentIndex}) : super(key: key);

  @override
  State<BottomAppBar2> createState() => _BottomAppBar2State();
}

class _BottomAppBar2State extends State<BottomAppBar2> {
  int currentBottomNavigationIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentBottomNavigationIndex = widget.currentIndex;
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (index) => setState(() => currentBottomNavigationIndex = index),
      currentIndex: currentBottomNavigationIndex,
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle: TextStyle(
        fontWeight: FontWeight.w600,
      ),
      unselectedLabelStyle: TextStyle(
        fontWeight: FontWeight.w600,
      ),
      selectedIconTheme: IconThemeData(color: kPrimaryColor2),
      unselectedIconTheme: IconThemeData(color: kSecondaryColor),
      selectedFontSize: 12,
      unselectedFontSize: 12,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: [
        // getNavItem(),
        getNavItem(Icons.shopping_bag_outlined, "shopping_bag",const CartDetails(), 0),
        getNavItem(Icons.favorite_border, "favorite", const FavouriteScreen(), 1),
        getNavItem(Icons.home_outlined, "home", const HomeBody(), 2),
        getNavItem(Icons.search_outlined, "search", const Search(), 3),
        getNavItem(Icons.person_outline, "person", const ProfileScreen(), 4,),
      ],
    );
  }

  toGoPath(Widget screen) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => screen));
  }

  getNavItem(IconData icon, String name, Widget screen, int index) {
    return BottomNavigationBarItem(
      icon: IconButton(
        onPressed: () => toGoPath(TopAppBar(body: screen, index: index)),
        icon: Icon(icon, size: kiconSize),
      ),
      label: name,
    );
  }
}
