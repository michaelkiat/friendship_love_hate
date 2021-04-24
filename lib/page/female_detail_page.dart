import 'package:flutter/material.dart';
import 'package:friendship_love_hate/util/color_utils.dart';
import 'package:friendship_love_hate/widget/my_app_bar.dart';
import 'package:friendship_love_hate/widget/my_header.dart';
import 'package:friendship_love_hate/widget/my_page.dart';

class FemaleDetailPage extends StatefulWidget {
  @override
  _FemaleDetailPageState createState() => _FemaleDetailPageState();
}

class _FemaleDetailPageState extends State<FemaleDetailPage> {
  @override
  Widget build(BuildContext context) {
    return MyPage(
      appBar: MyAppBar(
        backgroundColor: ColorUtils.lightPink,
      ),
      backgroundColor: ColorUtils.lightPink,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyHeader(
            title: "Female Page",
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
