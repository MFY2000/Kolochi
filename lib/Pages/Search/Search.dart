// ignore_for_file: file_names

import 'package:fb_login_app/Pages/Home/Components/Search/SearchFeild.dart';
import 'package:flutter/material.dart';
import 'package:fb_login_app/Components/Custom/Cards/Product/ProductCard_2.dart';
import 'package:fb_login_app/Components/Custom/Function/FunctionFactory.dart';
import 'package:fb_login_app/Config/size_config.dart';
import 'package:fb_login_app/Model/ModelClasses.dart';
import 'package:fb_login_app/Model/ModelFactory.dart';
import 'package:fb_login_app/Pages/Details/ProductDetails.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  late TextEditingController searchFeild;
  List<ProductModel> afterSraech = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    afterSraech = productsList;
    searchFeild = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SearchFeild(
            onChange: search,
          ),
          GridView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: afterSraech.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: (.65),
                crossAxisCount: 2,
              ),
              itemBuilder: (BuildContext context, int index) {
                return SizedBox(
                    height: getSize(false, .34),
                    child: ProductCard_2(
                        item: productsList[index],
                        onFavourite: () => addToFavourite(favouriteList[index],
                            favouriteList[index].isFavourite)));
              })
        ],
      ),
    );
  }

  addToFavourite(id, bool condition) {
    setState(() {
      favourite(productsList.indexOf(id), condition);
    });
  }

  search(String value) {
    List<ProductModel> temp = [];

    for (var item in productsList) {
      for (var tag in item.tags) {
        if (tag.contains(value)) {
          temp.add(item);
          break;
        }
      }
    }
    setState(() {
      afterSraech = temp;
    });
  }
}
