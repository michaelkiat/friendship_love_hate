import 'package:flutter/material.dart';
import 'package:friendship_love_hate/util/dimension_utils.dart';
import 'package:friendship_love_hate/util/font_size_utils.dart';
import 'package:friendship_love_hate/widget/my_elevated_button.dart';
import 'package:friendship_love_hate/widget/my_flat_button.dart';
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
          Padding(
            padding: EdgeInsets.all(DimensionUtils.dp_16),
            child: Text(
              "Friendship, Love or Hate",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: FontSizeUtils.large,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          MyFlatButton(
            onPressed: () {
              print('helo world');
            },
          ),
          MyElevatedButton(
            onPressed: () {
              print('helo world');
            },
          )
        ],
      ),
      bottomNavigationBar: MyElevatedButton(
        onPressed: () {
          print('helo world');
        },
      ),
    );
  }
}
