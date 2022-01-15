import 'package:fb_login_app/Services/DB_Services.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserInfoModel {
  late final String name;
  late final String email;
  late final String uid;
  late String profilePic = "https://upload.wikimedia.org/wikipedia/commons/7/7c/Profile_avatar_placeholder_large.png";

  UserInfoModel({required this.name, required this.email, required this.uid});

  UserInfoModel.secondInfo(
      String kname, String kemail, String kuid, String kprofilePic) {
    name = kname;
    email = kemail;
    uid = kuid;
    profilePic = kprofilePic;
  }

  UserInfoModel.thirdInfo(String uid){
    this.uid = uid;
    getUser();
  }

  StoreUserInfor() {
    Map<String, String> data = {
      "name": this.name,
      "email": this.email,
      "uid": this.uid,
      "profilePic": this.profilePic
    };

    DB_Services().storeUser(data);
  }

  getUser() async {
    var data = await DB_Services().getUserData(uid);

    name = data["name"];
    email = data["email"];
    profilePic = data["profilePic"];
  }
}
