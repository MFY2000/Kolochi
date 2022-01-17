import 'dart:convert';

import 'package:fb_login_app/API/API_Route.dart';
import 'package:fb_login_app/API/getApi.dart';
import 'package:fb_login_app/Components/Custom/Function/FunctionFactory.dart';
import 'package:fb_login_app/Model/ModelClasses.dart';

import 'package:flutter/services.dart';

late List<ProductModel> topPromoList = [];
late List<ProductModel> productsList = [];
late List<ProductDetailsModel> productsDetailsList = [];
late List<ProductModel> favouriteList = [];
late List<CartsDetailsModel> cartList = [];

late UserInformation currentUser;
late OrderDetails orderDetails = OrderDetails();
late CreateAddressModel newAddressModel;

Future<bool> readJson() async {
  final String response =
      await rootBundle.loadString('assets/Json/sample.json');
  final data = await json.decode(response);

  getUserInforamtion(await getApi(api_GET_UserDetails + "klsvlndslamfdlmmsf"));
  topPromoList = await getProduct(api_GET_Product + "?new=TRUE");
  productsList = await getProduct(api_GET_Product);

  getDataOfFavourite(await getApi(api_GET_Favourite + currentUser.id));
  getDataOfCart(await getApi(api_GET_Cart + currentUser.id));

  currentUser.address =
      getDataOfAddress(await getApi(api_GET_Address + currentUser.id));
  getDataOfProductDetailsModel(await getApi(api_GET_Product));

  return true;
}

getProduct(String apiRoute) async {
  final data = await getApi(apiRoute);
  return getDataOfProductModel(data);
}

getUserInforamtion(var data) {
  currentUser = UserInformation(
      uid: data["uid"],
      address: [],
      email: data["email"],
      image: data["profilePic"],
      name: data["username"],
      id: data["_id"]);
}

getDataOfAddress(var data) {
  List<AdressModel> toReturn = [];
  currentUser.addressID = data["_id"];

  for (var item in data["Address"]) {
    toReturn.add(AdressModel(
        name: item["Clientname"],
        aid: item["aid"],
        addressLane: item["addressLane"],
        city: item["city"],
        phoneNumber: item["phoneNumber"],
        postalCode: item["postalCode"]));
  }
  return toReturn;
}

getDataOfProductModel(var data) {
  List<ProductModel> templist = [];
  for (var item in data) {
    templist.add(ProductModel(
        pid: item["_id"],
        price: item["price"],
        rating: item["rating"],
        isAssets: item["isAssets"],
        image: item["image"],
        isFavourite: false,
        subTitle: item["subTitle"],
        title: item["title"],
        tags: item["tags"]));
  }
  return templist;
}

getDataReview(var data) {
  List<ReviewDetails> toReturn = [];
  if (data != null) {
    for (var item in data["Reviews"]) {
      toReturn.add(ReviewDetails(
          reviewId: data["_id"],
          name: item["Clientname"],
          reviewDetails: item["reviewDetails"],
          profilePic: item["profilePic"]));
    }
  }

  return toReturn;
}

getDataOfProductDetailsModel(var data) async {
  productsDetailsList = [];
  for (var item in data) {
    productsDetailsList.add(ProductDetailsModel(
        afterPrice: item["afterPrice"],
        noReview: getDataReview(await getApi(api_GET_Review + item["_id"])),
        pid: item["_id"],
        desciption: item["desc"],
        avialableColors: getListNum(item["avialableColors"]),
        avialableSize: getListNum(item["avialableSize"]),
        imagesList: item["imagesList"]));
  }
}

getDataOfFavourite(var data) {
  favouriteList = [];
  currentUser.favouriteId = data["_id"];

  for (var i in data["products"]) {
    for (var j in productsList) {
      if (i == j.pid) {
        !favouriteList.contains(j) ? favouriteList.add(j) : null;
        j.isFavourite = true;
      }
    }
  }
}

getDataOfCart(var data) {
  cartList = [];
  currentUser.cartsId = data["_id"];

  for (var item in data["products"]) {
    cartList.add(CartsDetailsModel(
        item["productId"], item["quantity"], item["size"], item["color"]));
  }
}

getDataFromJson() {
  // product1 = ProductModel(
  //     pid: 001,
  //     price: 8.1,
  //     rating: 3.5,
  //     isAssets: true,
  //     image: "assets/images/Sample.png",
  //     isFavourite: false,
  //     subTitle: "25% off in \nour All product",
  //     title: "Halloweeen Offer",
  //     tags: ["T-shirt", "Male", "Man"]);

  // product2 = ProductModel(
  //     pid: 002,
  //     price: 8.1,
  //     rating: 3.5,
  //     isAssets: true,
  //     image: "assets/images/t4.png",
  //     isFavourite: true,
  //     subTitle: "25% off in \nour All product",
  //     title: "Halloweeen Offer",
  //     tags: ["T-shirt", "Male", "Man"]);

  // product3 = ProductModel(
  //     pid: 003,
  //     price: 8.1,
  //     rating: 3.5,
  //     isAssets: true,
  //     image: "assets/images/full1.png",
  //     isFavourite: true,
  //     subTitle: "25% off in \nour All product",
  //     title: "Halloweeen Offer",
  //     tags: ["T-shirt", "Male", "Man"]);

  topPromoList = [
    // product1,
    // product2,
    // product3,
  ];

  // productsList = [
  //   product1,
  //   product2,
  //   product3,
  // ];

  // productsDetailsList = [
  //   product1Details,
  // ];

  // favouriteList = [
  //   product2,
  //   product3,
  // ];

  // cartList = [
  //   CartsDetailsModel(product2.pid),
  //   CartsDetailsModel(product3.pid),
  // ];
}
