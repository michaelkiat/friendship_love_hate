import 'package:flutter/material.dart';
import 'package:friendship_love_hate/core/router/route_name.dart';
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyHeader(
            title: "Friendship, Love or Hate",
            textAlign: TextAlign.center,
          ),
          MyElevatedButton(
            buttonText: 'Male',
            onPressed: () {
              print('helo world');
              Navigator.pushNamed(context, RouteName.maleDetailPage);
            },
          ),
          MyElevatedButton(
            buttonText: 'Female',
            onPressed: () {
              print('helo world');
              Navigator.pushNamed(context, RouteName.femaleDetailPage);
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
