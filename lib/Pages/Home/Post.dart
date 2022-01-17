// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:fb_login_app/Config/constants.dart';
import 'package:fb_login_app/Config/size_config.dart';

class PostData extends StatefulWidget {
  const PostData({Key? key}) : super(key: key);

  @override
  _PostDataState createState() => _PostDataState();
}

class _PostDataState extends State<PostData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.check))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(padding: EdgeInsets.all(100)),
            Container(
              padding: const EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.centerLeft,
              decoration: getBottomBorder(),
              child: TextButton(
                child: const Text("Tag People",
                    style: TextStyle(color: Colors.black, fontSize: 16)),
                onPressed: () => {},
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.centerLeft,
              decoration: getBottomBorder(),
              child: TextButton(
                child: const Text("Add Location",
                    style: TextStyle(color: Colors.black, fontSize: 16)),
                onPressed: () => {},
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              height: 50,
              decoration: getBottomBorder(),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) => Container(
                  height: 15,
                  margin: EdgeInsets.symmetric(horizontal: 2),
                  child: Container(
                    alignment: Alignment.center,
                    color: Colors.grey.shade300,
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      "Karachi",
                      style:
                          TextStyle(color: Colors.grey.shade800, fontSize: 14),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              decoration: getBottomBorder(),
              child: Row(
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width * .1,
                      height: MediaQuery.of(context).size.width * .1,
                      child: Image.asset(
                        "assets/images/Sample.png",
                        fit: BoxFit.cover,
                      )),
                  SizedBox(
                      width: MediaQuery.of(context).size.width * .85,
                      child: TextField(
                        decoration: getInputStyle(),
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  getBottomBorder() {
    return BoxDecoration(
        border: Border(
      bottom: BorderSide(width: 1, color: Colors.grey.shade600),
    ));
  }

  getInputStyle() {
    return const InputDecoration(
      hintStyle: TextStyle(fontSize: 17),
      hintText: 'Write a caption',
      border: InputBorder.none,
      enabledBorder: InputBorder.none,
      errorBorder: InputBorder.none,
      focusedBorder: InputBorder.none,
      focusedErrorBorder: InputBorder.none,
      contentPadding: EdgeInsets.all(18),
    );
  }
}
