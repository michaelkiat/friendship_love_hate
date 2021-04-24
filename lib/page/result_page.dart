import 'package:flutter/material.dart';
import 'package:friendship_love_hate/core/router/route_name.dart';
import 'package:friendship_love_hate/util/color_utils.dart';
import 'package:friendship_love_hate/widget/my_elevated_button.dart';
import 'package:friendship_love_hate/widget/my_header.dart';
import 'package:friendship_love_hate/widget/my_page.dart';

class ResultPage extends StatefulWidget {
  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: MyPage(
        backgroundColor: ColorUtils.lightTeal,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyHeader(
              title: "Result Page",
              textAlign: TextAlign.center,
              headerType: HeaderType.header2,
            ),
          ],
        ),
        bottomNavigationBar: MyElevatedButton(
          buttonText: 'Done',
          onPressed: () {
            Navigator.popUntil(
              context,
              ModalRoute.withName(RouteName.homePage),
            );
          },
        ),
      ),
    );
  }
}
