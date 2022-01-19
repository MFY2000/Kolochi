import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:fb_login_app/Components/AppBar/Bottom/BottomAppBar2.dart';
import 'package:fb_login_app/Components/Drawer/CustomDrawer.dart';
import 'package:fb_login_app/Config/constants.dart';

class TopAppBar extends StatefulWidget {
  final Widget body;
  final int index;
  const TopAppBar({Key? key, required this.body, required this.index})
      : super(key: key);

  @override
  TopAppBarState createState() => TopAppBarState();
}

class TopAppBarState extends State<TopAppBar> {
  final _advancedDrawerController = AdvancedDrawerController();

  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
        openRatio: .6,
        backdropColor: kPrimaryColor2,
        controller: _advancedDrawerController,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 300),
        childDecoration: const BoxDecoration(
          gradient: kPrimaryGradientColor,
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        drawer: CustomDrawer(index: widget.index,),
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
            actions: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Icon(
                  Icons.notifications,
                  size: 20,
                  
                ),
              )
            ],
          ),
          body: widget.body,
          bottomNavigationBar: BottomAppBar2(
            currentIndex: widget.index,
          ),
        ));
  }

  void _handleMenuButtonPressed() {
    // NOTICE: Manage Advanced Drawer state through the Controller.
    // _advancedDrawerController.value = AdvancedDrawerValue.visible();
    _advancedDrawerController.showDrawer();
  }
}
