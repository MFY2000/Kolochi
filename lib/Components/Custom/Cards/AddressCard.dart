import 'package:flutter/material.dart';
import 'package:fb_login_app/Config/size_config.dart';
import 'package:fb_login_app/Model/ModelClasses.dart';

class AddressCard extends StatelessWidget {
  AdressModel data;
  int group;
  int index;
  Function(int index) onSelect;

  AddressCard(
      {Key? key,
      required this.data,
      required this.group,
      required this.onSelect,
      required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: getSize(true, 0.7),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${data.addressLane} \n${data.city} \n${data.phoneNumber}",
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ],
            ),
          ),
          Radio(
              value: index,
              groupValue: group,
              onChanged: (int? value) => onSelect(value!)),
        ],
      ),
    );
  }
}
