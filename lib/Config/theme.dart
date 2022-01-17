import 'package:fb_login_app/Config/size_config.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

ThemeData theme() {
  return ThemeData(
      scaffoldBackgroundColor: kPrimaryLightColor,
      primaryColor: kPrimaryColor,
      fontFamily: "Overlook",
      appBarTheme: appBarTheme(),
      textTheme: textTheme(),
      inputDecorationTheme: inputDecorationTheme(),
      visualDensity: VisualDensity.adaptivePlatformDensity,
      floatingActionButtonTheme: getFloatingButton());
}

InputDecorationTheme inputDecorationTheme() {
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(28),
    borderSide: const BorderSide(color: kTextColor),
    gapPadding: 10,
  );
  return InputDecorationTheme(
    floatingLabelBehavior: FloatingLabelBehavior.always,
    contentPadding: const EdgeInsets.symmetric(horizontal: 42, vertical: 20),
    enabledBorder: outlineInputBorder,
    focusedBorder: outlineInputBorder,
    border: outlineInputBorder,
  );
}

TextTheme textTheme() {
  return const TextTheme(
    button: TextStyle(
      color: kPrimaryLightColor,
    ),
    headline1: headingStyle,
    headline2: TextStyle(
      color: kHeading,
      fontFamily: "Times New Roman",
      fontSize: headingfontSize,
      height: 1,
    ),
    headline3: TextStyle(
      color: khighLightColor,
      fontFamily: "Times New Roman",
      fontSize: headingfontSize - 4,
      height: 1,
    ),
    headline4: TextStyle(
      color: kHeading,
      fontFamily: "Times New Roman",
      fontSize: headingfontSize - 8,
      height: 1,
      decoration: TextDecoration.lineThrough,
    ),
    bodyText1: TextStyle(
      fontFamily: "Times New Roman",
      color: kTextColor,
      fontSize: fontSize - 2,
    ),
    bodyText2: TextStyle(
        fontFamily: "Times New Roman", color: kHeading, fontSize: fontSize),
  );
}

AppBarTheme appBarTheme() {
  return const AppBarTheme(
      elevation: 0,
      iconTheme: IconThemeData(color: kSecondaryColor),
      backgroundColor: kPrimaryLightColor,
      shadowColor: kPrimaryColor);
}

BoxShadow getShadow(Color colorTo) {
  return BoxShadow(
    color: colorTo.withOpacity(.5),
    spreadRadius: 1,
    blurRadius: 20,
    offset: const Offset(0, 14), // changes position of shadow
  );
}

getFloatingButton() {
  return FloatingActionButtonThemeData(backgroundColor: kPrimaryLightColor);
}

getBottomBorder() {
  return BoxDecoration(
      border: Border(
    bottom: BorderSide(width: 1, color: Colors.grey.shade600),
  ));
}
