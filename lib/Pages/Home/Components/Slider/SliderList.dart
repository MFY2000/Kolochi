import 'package:fb_login_app/Components/Custom/Cards/SliderCard.dart';
import 'package:fb_login_app/Config/size_config.dart';
import 'package:fb_login_app/Pages/Home/Components/Slider/SliderIndicate.dart';
import 'package:flutter/material.dart';

class SliderList extends StatefulWidget {
  const SliderList({Key? key}) : super(key: key);

  @override
  _SliderListState createState() => _SliderListState();
}

class _SliderListState extends State<SliderList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: getSize(false, .215),
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(
                    margin:
                        EdgeInsets.symmetric(horizontal: getSize(false, .01)),
                    child: SliderCard());
              }),
        ),
        Container(
          height: 10,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return SliderIndicate();
                }))
      ],
    );
  }
}
