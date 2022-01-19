import 'dart:convert';
import 'dart:math';

import 'package:fb_login_app/API/API_Route.dart';
import 'package:fb_login_app/API/PostAPI.dart';
import 'package:fb_login_app/Model/ModelClasses.dart';
import 'package:fb_login_app/Model/ModelFactory.dart';
import 'package:firebase_auth/firebase_auth.dart';

bool isAlreadyCart(String pid, int i, int j) {
  bool toReturn = false;

  for (var item in cartList) {
    toReturn = item.pid == pid;
    if (toReturn) {
      item.selectedColor = i;
      item.selectedSize = j;
    }
  }

  return toReturn;
}

dynamic cartSelected(String pid) {
  List<num> selected = [1, 1];

  for (var item in cartList) {
    if (item.pid == pid) {
      selected[0] = item.selectedColor;
      selected[1] = item.selectedSize;
      carts();
    }
  }

  return selected;
}

getListNum(var data) {
  List<num> toReturn = [];

  for (var item in data) {
    toReturn.add(item);
  }

  return toReturn;
}

String generateRandomString(int len) {
  var r = Random();
  return String.fromCharCodes(
      List.generate(len, (index) => r.nextInt(33) + 89));
}

favourite(int index, bool condition) {
  productsList[index].isFavourite = !condition;

  if (condition) {
    favouriteList.remove(productsList[index]);
  } else {
    favouriteList.add(productsList[index]);
  }

  String apiRoute = api_POST_Favourite + currentUser.favouriteId;
  List<String> list = getValueFromList(favouriteList);

  var data = jsonEncode({"products": list});

  updateApi(apiRoute, data);
}

carts() {
  String apiRoute = api_POST_Cart + currentUser.cartsId;

  List<Map<String, dynamic>> list = [];

  for (var item in cartList) {
    list.add({
      "productId": item.pid,
      "quantity": item.quantity,
      "color": item.selectedColor,
      "size": item.selectedSize,
    });
  }

  var data = jsonEncode({"products": list});

  updateApi(apiRoute, data);
}

getValueFromList(var data) {
  List<String> toReturn = [];

  for (var item in data) {
    toReturn.add(item.pid);
  }
  return toReturn;
}

setUserInfo(UserCredential user) async {
  var data = jsonEncode({
    "username": user.user!.displayName,
    "email": user.user!.email,
    "uid": user.user!.uid,
    "profilePic": user.user!.photoURL
  });

  await createNewUder(data);
}

createNewUder(var data) async {
  postApi(api_POST_UserDetails, data);
}

addressToAdd() {
  String apiRoute = api_POST_Address + currentUser.addressID;

  List<Map<String, dynamic>> list = [];

  for (var item in currentUser.address) {
    list.add({
      "Clientname": item.name,
      "aid": item.aid,
      "addressLane": item.addressLane,
      "city": item.city,
      "postalCode": item.postalCode,
      "phoneNumber": item.phoneNumber,
    });
  }

  var data = jsonEncode({"Address": list});
  print(apiRoute);
  updateApi(apiRoute, data);
}

placeOrder() {
  String apiRoute = api_POST_Order;

  var address = {
    "Clientname": orderDetails.selectedAddress.name,
    "aid": orderDetails.selectedAddress.aid,
    "addressLane": orderDetails.selectedAddress.addressLane,
    "city": orderDetails.selectedAddress.city,
    "postalCode": orderDetails.selectedAddress.postalCode,
    "phoneNumber": orderDetails.selectedAddress.phoneNumber,
  };

  List<Map<String, dynamic>> orderProduct = [];

  for (var item in orderDetails.orderList) {
    orderProduct.add({
      "productId": item.pid,
      "quantity": item.quantity,
      "color": item.selectedColor,
      "size": item.selectedSize,
    });
  }

  var data = jsonEncode({
    "userId": currentUser.id,
    "address": address,
    "products": orderProduct,
    "amount": orderDetails.totalPrice
  });

  print(api_POST_Order);
  postApi(apiRoute, data);
}
