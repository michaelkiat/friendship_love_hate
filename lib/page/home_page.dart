import 'package:flutter/material.dart';
import 'package:friendship_love_hate/core/router/route_name.dart';
import 'package:friendship_love_hate/util/color_utils.dart';
import 'package:friendship_love_hate/widget/my_app_bar.dart';
import 'package:friendship_love_hate/widget/my_elevated_button.dart';
import 'package:friendship_love_hate/widget/my_header.dart';
import 'package:friendship_love_hate/widget/my_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MyPage(
      appBar: MyAppBar(
        backgroundColor: ColorUtils.lightTeal,
      ),
      backgroundColor: ColorUtils.lightTeal,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyHeader(
            title: "Friendship, Love or Hate",
            textAlign: TextAlign.center,
          ),
          MyElevatedButton(
            buttonText: 'Male',
            onPressed: () {
              Navigator.pushNamed(
                context,
                RouteName.maleDetailPage,
                arguments: true,
              );
            },
          ),
          MyElevatedButton(
            buttonText: 'Female',
            onPressed: () {
              Navigator.pushNamed(
                context,
                RouteName.femaleDetailPage,
                arguments: true,
              );
            },
          ),
        ],
      ),
      // bottomNavigationBar: MyElevatedButton(
      //   onPressed: () {
      //     print('helo world');
      //   },
      // ),
    );
  }
}
