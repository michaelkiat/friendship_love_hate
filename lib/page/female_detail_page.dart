import 'package:flutter/material.dart';
import 'package:friendship_love_hate/core/router/route_name.dart';
import 'package:friendship_love_hate/util/color_utils.dart';
import 'package:friendship_love_hate/widget/my_app_bar.dart';
import 'package:friendship_love_hate/widget/my_elevated_button.dart';
import 'package:friendship_love_hate/widget/my_header.dart';
import 'package:friendship_love_hate/widget/my_page.dart';

class FemaleDetailPage extends StatefulWidget {
  FemaleDetailPage({
    @required this.isFirstPage,
  });
  final bool isFirstPage;

  @override
  _FemaleDetailPageState createState() => _FemaleDetailPageState();
}

class _FemaleDetailPageState extends State<FemaleDetailPage> {
  bool get isFirstPage => widget.isFirstPage;

  onPressButton() {
    if (isFirstPage)
      Navigator.pushNamed(
        context,
        RouteName.maleDetailPage,
        arguments: false,
      );
    else
      Navigator.pushNamed(
        context,
        RouteName.resultPage,
      );
  }

  String buttonText() {
    return isFirstPage ? 'Male' : 'View Results';
  }

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
            headerType: HeaderType.header2,
          ),
        ],
      ),
      bottomNavigationBar: MyElevatedButton(
        buttonText: buttonText(),
        onPressed: onPressButton,
      ),
    );
  }
}
