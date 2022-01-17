import 'package:fb_login_app/Components/Custom/Cards/SliderCard.dart';
import 'package:fb_login_app/Config/constants.dart';
import 'package:fb_login_app/Config/size_config.dart';
import 'package:fb_login_app/Model/SliderPromo.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SliderList extends StatefulWidget {
  const SliderList({Key? key}) : super(key: key);

  @override
  _SliderListState createState() => _SliderListState();
}

class _SliderListState extends State<SliderList> {
  final controller = PageController(viewportFraction: 0.8, keepPage: true);

  @override
  Widget build(BuildContext context) {
    final pages = List.generate(
        sliderList.length,
        (index) => Container(
            margin: EdgeInsets.symmetric(horizontal: getSize(false, .01)),
            child: SliderCard(
              item: sliderList[index],
            )));

    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      SizedBox(
        height: getSize(false, .215),
        child: PageView.builder(
          controller: controller,
          // itemCount: pages.length,
          itemBuilder: (context, index) {
            return pages[index % pages.length];
          },
        ),
      ),

      // SmoothPageIndicator(
      //   controller: controller,
      //   count: pages.length,
      //   effect: WormEffect(
      //     dotHeight: 5,
      //     dotWidth: 10,
      //     type: WormType.thin,
      //     // strokeWidth: 5,
      //   ),
      // ),
      SmoothPageIndicator(
        controller: controller,
        count: pages.length,
        effect: const JumpingDotEffect(
          dotHeight: 5,
          dotWidth: 10,
          jumpScale: .7,
          verticalOffset: 15,
          dotColor: kSecondaryColor,
          activeDotColor: kPrimaryColor,
        ),
      ),
    ]);
  }
}
