// ignore_for_file: file_names

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fb_login_app/Components/AppBar/Bottom/BottomAppBar2.dart';
import 'package:fb_login_app/Components/AppBar/Top/AppBar.dart';
import 'package:fb_login_app/Components/Custom/Cards/Product/ProductCard_2.dart';
import 'package:fb_login_app/Components/Custom/Function/FunctionFactory.dart';
import 'package:fb_login_app/Config/size_config.dart';
import 'package:fb_login_app/Model/ModelFactory.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  _FavouriteScreenState createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.symmetric(
                vertical: getSize(false, .025), horizontal: getSize(true, .05)),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Favourite",
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  SizedBox(
                    height: getSize(true, .075),
                  ),
                  favouriteList.isNotEmpty
                      ? GridView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: favouriteList.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: (.63),
                            crossAxisCount: 2,
                          ),
                          itemBuilder: (BuildContext context, int index) {
                            return SizedBox(
                                height: getSize(false, .35),
                                child: ProductCard_2(
                                    item: favouriteList[index],
                                    onFavourite: () =>
                                      addToFavourite(favouriteList[index], favouriteList[index].isFavourite)
                                    ));
                          })
                      : const Text("no item to display"),
                ])));
  }


  addToFavourite(id, bool condition) {
    setState(() {
      favourite(productsList.indexOf(id), condition);
    });
  }
}
