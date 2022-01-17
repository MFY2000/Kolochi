import 'package:fb_login_app/Components/Custom/Function/FunctionFactory.dart';
import 'package:fb_login_app/Config/constants.dart';
import 'package:fb_login_app/Model/ModelFactory.dart';
import 'package:fb_login_app/Model/TextFeildModel.dart';

class ProductModel {
  final String pid, title, subTitle, image;

  final num rating, price;

  final bool isAssets;
  late bool isFavourite;

  final List<dynamic> tags;

  ProductModel({
    required this.pid,
    required this.rating,
    required this.price,
    required this.isAssets,
    required this.title,
    required this.image,
    required this.subTitle,
    required this.isFavourite,
    required this.tags,
  });
}

class ProductDetailsModel {
  final num afterPrice;

  final String desciption, pid;

  final List<num> avialableColors, avialableSize;

  final List<ReviewDetails> noReview;

  final List<dynamic> imagesList;

  ProductDetailsModel(
      {required this.noReview,
      required this.afterPrice,
      required this.pid,
      required this.desciption,
      required this.avialableColors,
      required this.avialableSize,
      required this.imagesList});
}

class ReviewDetails {
  final String name, reviewDetails, profilePic, reviewId;

  ReviewDetails(
      {required this.reviewId,
      required this.name,
      required this.reviewDetails,
      required this.profilePic});

  // final num reviewId;

}

class CartsDetailsModel {
  late num price, quantity, selectedColor, selectedSize;

  late String pid, name, subTitle, image;
  late bool isAssets = true;

  CartsDetailsModel(
      String id, this.quantity, this.selectedColor, this.selectedSize) {
    ProductModel data =
        productsList.firstWhere((element) => (id == element.pid));

    pid = id;
    isAssets = data.isAssets;
    name = data.title;
    subTitle = data.subTitle;
    image = data.image;
    price = data.price;
  }
}

class UserInformation {
  String name, image, email, uid, id;
  List<AdressModel> address;
  late String cartsId, favouriteId, addressID;

  UserInformation({
      required this.uid,
      required this.id,
      required this.name,
      required this.email,
      required this.image,
      required this.address});

  addNewAddress(String name, String addressLane, String city, String postalCode, String phoneNumber) {
    address.add(AdressModel(
        name: name,
        aid: generateRandomString(7),
        addressLane: addressLane,
        city: city,
        postalCode: postalCode,
        phoneNumber: phoneNumber));
  }
}

class AdressModel {
  late String name, aid, addressLane, city, postalCode, phoneNumber;

  AdressModel(
      {required this.name,
      required this.aid,
      required this.addressLane,
      required this.city,
      required this.postalCode,
      required this.phoneNumber});
}

class OrderDetails {
  late num price = 0;
  late num discountPrice;
  late num totalPrice;
  late AdressModel selectedAddress;
  late List<CartsDetailsModel> orderList;
  // late Payment

  setOrderCart(List<CartsDetailsModel> orderList) {
    orderList = orderList;
    price = 0;
    for (var item in orderList) {
      price += item.price * item.quantity;
    }
    price = num.parse(price.toStringAsFixed(2));
    discountPrice = (discount / 100) * price;
    totalPrice = price - discountPrice;
    totalPrice = num.parse(totalPrice.toStringAsFixed(2));
  }

  orderPlace() {}
}

class CreateAddressModel {
  late TextFeildModel name, address, city, postal, phone;

  CreateAddressModel(String value) {
    name = TextFeildModel(label: "Name");
    name.setControlValue(value);
    address = TextFeildModel(label: "Address lane");
    city = TextFeildModel(label: "City");
    postal = TextFeildModel(label: "Postal Code");
    phone = TextFeildModel(label: "Phone Number");
  }
}
