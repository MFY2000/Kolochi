// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:fb_login_app/Config/constants.dart';
import 'package:fb_login_app/Config/size_config.dart';
import 'package:fb_login_app/Config/theme.dart';

class SizeOrColorsTab extends StatefulWidget {
  final dynamic onChange;
  Map<String, dynamic> data;
  SizeOrColorsTab({Key? key, required this.onChange, required this.data})
      : super(key: key);

  @override
  _SizeOrColorsTabState createState() => _SizeOrColorsTabState();
}

class _SizeOrColorsTabState extends State<SizeOrColorsTab> {
  bool isSelected = true;

  List<num> sizes = [1, 1, 1, 1, 1];
  List<num> colors = [1, 1, 1, 1, 1];
  int selectedSize = 0;
  int selectedColor = 0;

  @override
  void initState() {
    // TODO: implement initState

    sizes = widget.data["Size"]["Available"];
    colors = widget.data["Color"]["Available"];
    selectedSize = widget.data["Size"]["Selected"];
    selectedColor = widget.data["Color"]["Selected"];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(getSize(true, .05)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                  onTap: () {
                    isSelectedState(true);
                  },
                  child: Text(
                    "Select Size",
                    style: TextStyle(
                        fontWeight:
                            isSelected ? FontWeight.w900 : FontWeight.normal),
                  )),
              SizedBox(
                width: getSize(true, .1),
              ),
              InkWell(
                  onTap: () {
                    isSelectedState(false);
                  },
                  child: Text(
                    "Select Color",
                    style: TextStyle(
                        fontWeight:
                            !isSelected ? FontWeight.w900 : FontWeight.normal),
                  )),
            ],
          ),
          SizedBox(
            height: getSize(false, .025),
          ),
          SizedBox(
            width: getSize(true, .8),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: isSelected ? getSizeList() : getColorList()),
          )
        ],
      ),
    );
  }

  getColorList() {
    List<Widget> sizeList = [];
    bool isSelectedIndex = true;

    for (var i = 0; i < sizes.length; i++) {
      isSelectedIndex = selectedColor == i;
      if (colors[i] == 1) {
        sizeList.add(InkWell(
            onTap: () => colors[i] == 1 ? selectingColor(i) : {},
            child: CircleAvatar(
              backgroundColor: kColors[i],
              child: isSelectedIndex
                  ? const Icon(
                      Icons.check,
                      color: kPrimaryLightColor,
                    )
                  : null,
            )));
      } else if (isSelectedIndex) {
        setState(() {
          selectedColor++;
        });
      }
    }

    return sizeList;
  }

  getSizeList() {
    List<Widget> sizeList = [];
    bool isSelectedIndex = true;
    Widget toReturn;

    for (var i = 0; i < sizes.length; i++) {
      isSelectedIndex = selectedSize == i;
      if (sizes[i] != 1) {
        if (isSelectedIndex) {
          setState(() {
            selectedSize = ++selectedSize;
          });
        }
        toReturn = Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(8),
          width: getSize(true, .12),
          height: getSize(false, .06),
          child: Text(
            kSizes[i],
            style: const TextStyle(fontSize: 18, color: kTextColor),
          ),
        );
      } else {
        toReturn = InkWell(
          onTap: () => selectingSize(i),
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(8),
            width: getSize(true, .12),
            height: getSize(false, .06),
            decoration: getSizesBox(i, sizes[i] == 1),
            child: Text(
              kSizes[i],
              style: TextStyle(
                  fontSize: 18,
                  color: isSelectedIndex ? kPrimaryLightColor : kTextColor),
            ),
          ),
        );
      }

      sizeList.add(toReturn);
    }

    return sizeList;
  }

  getSizesBox(int index, bool isFilled) {
    return BoxDecoration(
      color: isFilled ? kSecondaryColor2 : null,
      gradient: index == selectedSize ? kPrimaryGradientColor : null,
      boxShadow: index == selectedSize ? [getShadow(kTextColor)] : null,
    );
  }

  selectingSize(int size) {
    setState(() {
      selectedSize = size;
      widget.onChange("Size","Selected",size);
    });
  }

  selectingColor(int color) {
    setState(() {
      selectedColor = color;
      widget.onChange("Color","Selected",color);
    });
  }

  isSelectedState(bool state) {
    setState(() {
      isSelected = state;
    });
  }
}
