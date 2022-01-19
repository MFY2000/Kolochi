import 'package:flutter/material.dart';
import 'package:fb_login_app/Components/Custom/Button/CounterButton.dart';
import 'package:fb_login_app/Config/constants.dart';
import 'package:fb_login_app/Config/size_config.dart';
import 'package:fb_login_app/Model/ModelClasses.dart';

class CartCard extends StatelessWidget {
  final CartsDetailsModel item;
  final onRemove;
  final onCounterChange;
  final onClick;

  const CartCard({
    Key? key,
    required this.item,
    required this.onRemove,
    required this.onCounterChange,
    required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: onClick,
              child: Container(
                padding: const EdgeInsets.all(4.0),
                width: getSize(true, 0.3),
                height: getSize(false, 0.15),
                child: item.isAssets
                    ? Image.asset(
                        item.image,
                        fit: BoxFit.fill,
                      )
                    : Image.network(
                        item.image,
                        fit: BoxFit.fill,
                      ),
              ),
            ),
            Container(
              width: getSize(true, 0.38),
              height: getSize(false, 0.15),
              alignment: Alignment.centerLeft,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  Text(item.subTitle,
                      style: Theme.of(context).textTheme.bodyText1),
                  Text("\$ ${item.price}",
                      style: Theme.of(context).textTheme.headline3),
                  CounterButton(
                      startingValue: item.quantity, onChange: onCounterChange),
                ],
              ),
            ),
            IconButton(
              icon: const Icon(
                Icons.close,
                color: kHeading,
              ),
              onPressed: onRemove,
            )
          ],
        ),
      ),
    );
  }
}
