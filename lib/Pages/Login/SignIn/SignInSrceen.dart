// ignore_for_file: file_names

import 'package:fb_login_app/Components/Custom/Alert/AlertBox1.dart';
import 'package:fb_login_app/Components/Custom/Button/ButtonColored.dart';
import 'package:fb_login_app/Components/Custom/Function/FunctionFactory.dart';
import 'package:fb_login_app/Components/Custom/TextFeild/PasswordFeild.dart';
import 'package:fb_login_app/Components/Custom/TextFeild/TextFeild_1.dart';
import 'package:fb_login_app/Config/Validition.dart';
import 'package:fb_login_app/Config/size_config.dart';
import 'package:fb_login_app/Model/ModelFactory.dart';
import 'package:fb_login_app/Model/TextFeildModel.dart';
import 'package:fb_login_app/Pages/Login/SignIn/ForgetPassword.dart';
import 'package:fb_login_app/Pages/Login/SocialMeida/SocialMedia.dart';
import 'package:fb_login_app/Pages/MainScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignInSrceen extends StatefulWidget {
  const SignInSrceen({Key? key}) : super(key: key);

  @override
  _SignInSrceenState createState() => _SignInSrceenState();
}

class _SignInSrceenState extends State<SignInSrceen> {
  List<TextFeildModel> controller = [];
  bool isError = false;
  bool wait = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = [
      TextFeildModel(label: "Email"),
      TextFeildModel(label: "Password")
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: wait ? SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: getSize(true, .1), vertical: getSize(false, .05)),
          child: Column(
            children: [
              Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(bottom: getSize(false, .0125)),
                  child: Text(
                    "Sign In",
                    style: Theme.of(context).textTheme.headline2,
                  )),
              TextFeild1(reference: controller[0]),
              PasswordFeild(reference: controller[1]),
              Container(
                  margin: EdgeInsets.only(top: getSize(false, .0125)),
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                      onTap: () {
                        goToOtherRouter(const ForgetPassword());
                      },
                      child: Text(
                        "Forget Password ?",
                        style: Theme.of(context).textTheme.bodyText1,
                      ))),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: getSize(false, .0125),
                ),
                child: ButtonColored(function: onSiginClick, text: "Login"),
              ),
              const SocialMedia(
                isSignIN: false,
              ),
            ],
          ),
        ),
      ): Center(child: CircularProgressIndicator()),
    );
  }

  goToOtherRouter(Widget route) {
    Navigator.push(
        context, MaterialPageRoute(builder: (BuildContext context) => route));
  }

  onSiginClick() async {
    var isEmail = validtionConstantEmail(controller[0].value);
    var isPassword = validtionConstantPassword(controller[1].value);

    if (isEmail[0]) {
      setTextFeild(0, isEmail);
    }

    if (isPassword[0]) {
      setTextFeild(1, isPassword);
    }

    if (!isError) {
      setState(() {
        wait = false;
      });
      onSigIn();
    }
  }

  setTextFeild(int index, var data) {
    setState(() {
      controller[index].isError = data[0];
      controller[index].errorMessage = data[1];
      isError = data[0];
    });
  }

  onSigIn() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: controller[0].value, password: controller[1].value);

      // UserInfoModel.thirdInfo(userCredential.user!.uid);

      await getUser(userCredential.user!.uid);

      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) =>
                  MainScreen())); // HomeScreen(user: userCredential.user!)));

    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        alertBox1(context, "user Not Found", 'No user found for that email.');
      } else if (e.code == 'wrong-password') {
        alertBox1(context, "Wrong Password", 'Wrong password provided for that user.');
      }
    }
  }
}
