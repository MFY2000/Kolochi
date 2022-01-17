import 'package:flutter/material.dart';
import 'package:fb_login_app/Config/constants.dart';
import 'package:fb_login_app/Config/size_config.dart';

class CounterButton extends StatefulWidget {
  final num startingValue;
  final onChange;
  const CounterButton({Key? key, required this.startingValue,required this.onChange}) : super(key: key);

  @override
  _CounterButtonState createState() => _CounterButtonState();
}

class _CounterButtonState extends State<CounterButton> {
  num count = 0;
@override
  void initState() {
    // TODO: implement initState
    count = widget.startingValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kSecondaryColor2,
      width: getSize(true, 0.33),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
              onPressed: () {
                counterChange(false);
              },
              icon: Icon(Icons.add)),
          Container(
            padding: EdgeInsets.all(getSize(true, 0.08)),
            child: Text("$count"),
            decoration: BoxDecoration(border: Border.all(color: kPrimaryLightColor, width: 5)),
          ),
          IconButton(
              onPressed: () {
                counterChange(true);
              },
              icon: Icon(Icons.remove))
        ],
      ),
    );
  }

  void counterChange(bool isAdded) {
    bool condition = isAdded ? count > 1 : true;
    if (condition) {
      setState(() {
        count = isAdded ? --count : ++count;
        widget.onChange(count);
      });
    }
  }
}
