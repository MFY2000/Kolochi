import 'package:flutter/material.dart';
import 'package:fb_login_app/Config/constants.dart';
import 'package:fb_login_app/Config/size_config.dart';
import 'package:fb_login_app/Config/theme.dart';
import 'package:fb_login_app/Model/ModelFactory.dart';

class CalculatorTaxTable extends StatelessWidget {
  const CalculatorTaxTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getSize(false, 0.15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              getTextWidget("Subtotal", false),
              getTextWidget(" \$ ${orderDetails.price}", true)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              getTextWidget("Discount", false),
              getTextWidget(" $discount%", true)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              getTextWidget("Discount Price", false),
              getTextWidget(" \$ ${orderDetails.discountPrice}", true)
            ],
          ),
          Container(
            height: 1,
            decoration: getBottomBorder(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              getTextWidget("Total", true),
              getTextWidget(" \$ ${orderDetails.totalPrice}", true)
            ],
          ),
        ],
      ),
    );
  }

  getTextWidget(String value, bool isBold) {
    return Text(
      value,
      style: TextStyle(
          fontWeight: isBold ? FontWeight.w900 : FontWeight.normal,
          color: kTextColor,
          fontSize: 16),
    );
  }
}
