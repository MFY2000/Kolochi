import 'package:flutter/material.dart';
import 'package:fb_login_app/Components/AppBar/Bottom/BottomAppBar.dart';
import 'package:fb_login_app/Components/AppBar/Bottom/BottomAppBar2.dart';
import 'package:fb_login_app/Components/AppBar/Top/AppBar.dart';
import 'package:fb_login_app/Components/Custom/Alert/AlertBox1.dart';
import 'package:fb_login_app/Components/Custom/Button/IconButton.dart';
import 'package:fb_login_app/Components/Custom/Function/FunctionFactory.dart';
import 'package:fb_login_app/Components/Custom/TextFeild/TextFeild_1.dart';
import 'package:fb_login_app/Config/constants.dart';
import 'package:fb_login_app/Config/size_config.dart';
import 'package:fb_login_app/Config/theme.dart';
import 'package:fb_login_app/Model/ModelClasses.dart';
import 'package:fb_login_app/Model/ModelFactory.dart';
import 'package:fb_login_app/Model/TextFeildModel.dart';
import 'package:fb_login_app/Pages/Cart/CartDetails.dart';
import 'package:fb_login_app/Pages/Details/Components/DescriptionText.dart';
import 'package:fb_login_app/Pages/Details/Components/SizeOrColorsTab.dart';

class ProductDetails extends StatefulWidget {
  final ProductModel details;
  final List<num> selected;
  ProductDetails({required this.details, required this.selected, Key? key})
      : super(key: key);

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  late ProductDetailsModel itemdetails = productsDetailsList[0];
  late Map<String, dynamic> selected = {
    "Size": {"Available": [], "Selected": 0},
    "Color": {"Available": [], "Selected": 0},
  };

  bool isReview = false;

  @override
  void initState() {
    // TODO: implement initState
    itemdetails = productsDetailsList
        .firstWhere((element) => (element.pid == widget.details.pid));

    setSelection("Color", "Available", itemdetails.avialableColors);
    setSelection("Size", "Available", itemdetails.avialableSize);
    setSelection("Color", "Selected", widget.selected[0]);
    setSelection("Size", "Selected", widget.selected[1]);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar: const BottomAppBar2(
        currentIndex: 2,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(horizontal: getSize(true, .05)),
              decoration: getBottomBorder(),
              child: Column(
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        width: getSize(true, .9),
                        child: widget.details.isAssets
                            ? Image.asset(
                                widget.details.image,
                                fit: BoxFit.fill,
                              )
                            : Image.network(
                                widget.details.image,
                                fit: BoxFit.fill,
                              ),
                      ),
                      Positioned(
                          right: 8,
                          top: 5,
                          child: CircleAvatar(
                            backgroundColor: kPrimaryLightColor,
                            radius: 12,
                            child: Center(
                              child: IconButton(
                                onPressed: addToCart,
                                icon: const Icon(
                                  Icons.shopping_cart_outlined,
                                  size: 10,
                                ),
                              ),
                            ),
                          )),
                      Positioned(
                          left: 8,
                          bottom: 5,
                          child: getSilderImage(itemdetails.imagesList.length)),
                    ],
                  ),
                  Container(
                      margin: EdgeInsets.only(top: getSize(false, 0.035)),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        widget.details.title,
                        style: Theme.of(context).textTheme.headline2,
                      )),
                  Container(
                      margin:
                          EdgeInsets.symmetric(vertical: getSize(false, 0.015)),
                      alignment: Alignment.centerLeft,
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                                text: '\$ ${widget.details.price}',
                                style: Theme.of(context).textTheme.headline3),
                            const TextSpan(
                              text: '    ',
                            ),
                            TextSpan(
                                text: ' \$ ${itemdetails.afterPrice}',
                                style: Theme.of(context).textTheme.headline4),
                          ],
                        ),
                      )),
                ],
              ),
            ),
            Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(
                    horizontal: getSize(true, .05),
                    vertical: getSize(true, .025)),
                decoration: getBottomBorder(),
                child: Row(
                  children: [
                    Container(
                      width: getSize(true, .175),
                      height: getSize(false, .05),
                      margin: EdgeInsets.only(right: getSize(true, .075)),
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        gradient: kPrimaryGradientColor,
                      ),
                      child: Text(
                        "${widget.details.rating}",
                        style: const TextStyle(color: kPrimaryLightColor),
                      ),
                    ),
                    Text(
                      getRating(widget.details.rating),
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          IconButtonCustome(
                            function: () {
                              if (itemdetails.noReview.isNotEmpty) {
                                setState(() {
                                  isReview = !isReview;
                                });
                              }
                            },
                            icon: isReview
                                ? Icons.message_outlined
                                : Icons.arrow_drop_down,
                            text: "${itemdetails.noReview.length} Reviews ",
                          )
                        ],
                      ),
                    )
                  ],
                )),
            if (isReview)
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.all(getSize(true, .05)),
                decoration: getBottomBorder(),
                child: Column(
                  children: [
                    SizedBox(
                      height: getSize(false, .3),
                      child: ListView.builder(
                        itemCount: itemdetails.noReview.length,
                        itemBuilder: (context, index) => ListTile(
                          leading: CircleAvatar(
                            radius: 30,
                            backgroundImage: NetworkImage(
                              itemdetails.noReview[index].profilePic,
                            ),
                          ),
                          title: Text(itemdetails.noReview[index].name),
                          subtitle:
                              Text(itemdetails.noReview[index].reviewDetails),
                        ),
                      ),
                    ),
                    ListTile(
                        leading: CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage(
                            // Current User
                            currentUser.image,
                          ),
                        ),
                        title: Text(currentUser.name),
                        subtitle: TextFeild2(
                          reference: TextFeildModel(label: "Add Comments"),
                        ),
                        trailing: const Icon(
                          Icons.send_outlined,
                        ))
                  ],
                ),
              )
            else
              Container(),
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.all(getSize(true, .05)),
              decoration: getBottomBorder(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Description",
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  DescriptionTextWidget(text: itemdetails.desciption),
                ],
              ),
            ),
            SizeOrColorsTab(onChange: setSelection, data: selected),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                children: [
                  InkWell(
                    onTap: addToCart,
                    child: Container(
                      decoration: BoxDecoration(
                          color: kSecondaryColor2,
                          boxShadow: [getShadow(kTextColor)]),
                      height: getSize(false, 0.07),
                      width: getSize(true, 0.5),
                      alignment: Alignment.center,
                      child: const Text(
                        "Add to Cart",
                        style: TextStyle(
                          fontSize: 20,
                          color: kTextColor,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: goTo,
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: kPrimaryGradientColor,
                      ),
                      height: getSize(false, 0.07),
                      width: getSize(true, 0.5),
                      alignment: Alignment.center,
                      child: const Text(
                        "Buy Now",
                        style: TextStyle(
                            fontSize: 20,
                            color: kPrimaryLightColor,
                            fontWeight: FontWeight.w900),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: getSize(false, 0.1),
            )
          ],
        ),
      ),
    );
  }

  setSelection(String header, String path, var value) {
    setState(() {
      selected[header][path] = value;
    });
  }

  goTo() {
    if (!isAlreadyCart(
      itemdetails.pid,
      selected["Color"]["Selected"],
      selected["Size"]["Selected"],
    )) {
      addingCarts();
    }
    carts();
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const TopAppBar(body: CartDetails(), index: 0)),
    );
  }

  addToCart() {
    if (isAlreadyCart(
      itemdetails.pid,
      selected["Color"]["Selected"],
      selected["Size"]["Selected"],
    )) {
      alertBox1(context, "Already in Cart",
          "Already in Cart increase by Cart Screen");
    } else {
      setState(() {
        addingCarts();
      });
    }
    carts();
  }

  addingCarts() {
    cartList.add(CartsDetailsModel(
      itemdetails.pid,
      1,
      selected["Color"]["Selected"],
      selected["Size"]["Selected"],
    ));
  }

  getSilderImage(int slider) {
    List<Widget> lst = [];

    for (var i = 0; i < slider; i++) {
      lst.add(Container(
        margin: const EdgeInsets.only(right: 3),
        child: const CircleAvatar(
          backgroundColor: kPrimaryLightColor,
          radius: 5,
        ),
      ));
    }
    return Row(
      children: lst,
    );
  }

  getRating(num rating) {
    String reward = "";

    if (rating > 3.5) {
      reward = "Excellent";
    } else if (rating > 1.5) {
      reward = "Good";
    } else {
      reward = "Bad";
    }

    return reward;
  }
}
