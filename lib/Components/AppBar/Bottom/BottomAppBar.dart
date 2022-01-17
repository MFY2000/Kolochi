import 'package:flutter/material.dart';

import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:fb_login_app/Components/Drawer/CustomDrawer.dart';
import 'package:fb_login_app/Config/constants.dart';
import 'package:fb_login_app/Pages/Cart/CartDetails.dart';
import 'package:fb_login_app/Pages/Favourite/FavouriteScreen.dart';
import 'package:fb_login_app/Pages/Home/Components/HomeBody.dart';
import 'package:fb_login_app/Pages/Profile/ProfileScreen.dart';
import 'package:fb_login_app/Pages/Search/Search.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

late BuildContext testContext;

// ----------------------------------------- Provided Style ----------------------------------------- //

class BottomNavBarStyle extends StatefulWidget {
  final BuildContext menuScreenContext;
  const BottomNavBarStyle({Key? key, required this.menuScreenContext})
      : super(key: key);

  @override
  _BottomNavBarStyleState createState() => _BottomNavBarStyleState();
}

class _BottomNavBarStyleState extends State<BottomNavBarStyle> {
  int index = 2;
  late PersistentTabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: index);
  }

  List<Widget> _buildScreens() {
    return [
      const CartDetails(),
      const FavouriteScreen(),
      const HomeBody(),
      const Search(),
      const ProfileScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.shopping_bag_outlined),
        activeColorPrimary: kPrimaryColor2,
        inactiveColorPrimary: kSecondaryColor,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.favorite_border),
        activeColorPrimary: kPrimaryColor2,
        inactiveColorPrimary: kSecondaryColor,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(
          Icons.home_outlined,
          color: index == 2 ? kPrimaryColor2 : kSecondaryColor,
        ),
        activeColorPrimary: kSecondaryColor2,
        inactiveColorPrimary: kPrimaryLightColor,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.search_outlined),
        activeColorPrimary: kPrimaryColor2,
        inactiveColorPrimary: kSecondaryColor,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.person_outline),
        activeColorPrimary: kPrimaryColor2,
        inactiveColorPrimary: kSecondaryColor,
      ),
    ];
  }

  final _advancedDrawerController = AdvancedDrawerController();

  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
        openRatio :.6,
        backdropColor: kPrimaryColor2,
        controller: _advancedDrawerController,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 300),
        childDecoration: const BoxDecoration(
          gradient: kPrimaryGradientColor,
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        drawer: const CustomDrawer(index: 1,),
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: _handleMenuButtonPressed,
              icon: ValueListenableBuilder<AdvancedDrawerValue>(
                valueListenable: _advancedDrawerController,
                builder: (_, value, __) {
                  return AnimatedSwitcher(
                    duration: const Duration(milliseconds: 250),
                    child: Icon(
                      value.visible ? Icons.clear : Icons.menu,
                      key: ValueKey<bool>(value.visible),
                    ),
                  );
                },
              ),
            ),
          ),
          body: PersistentTabView(
            context,
            controller: _controller,
            screens: _buildScreens(),
            items: _navBarsItems(),
            resizeToAvoidBottomInset: true,
            navBarHeight: kBottomNavigationBarHeight,
            bottomScreenMargin: 0.0,
            selectedTabScreenContext: (context) {
              testContext = context!;
            },
            decoration: const NavBarDecoration(borderRadius: BorderRadius.zero),
            itemAnimationProperties: const ItemAnimationProperties(
              duration: Duration(milliseconds: 400),
              curve: Curves.ease,
            ),
            screenTransitionAnimation: const ScreenTransitionAnimation(
              animateTabTransition: true,
              curve: Curves.ease,
              duration: Duration(milliseconds: 200),
            ),
            navBarStyle: NavBarStyle.style15,
            
          ),
        ));
  }

  void _handleMenuButtonPressed() {
    // NOTICE: Manage Advanced Drawer state through the Controller.
    // _advancedDrawerController.value = AdvancedDrawerValue.visible();
    _advancedDrawerController.showDrawer();
  }
}
