import 'package:flutter/material.dart';
import 'package:friendship_love_hate/core/router/route_name.dart';
import 'package:friendship_love_hate/widget/my_app_bar.dart';
import 'package:friendship_love_hate/widget/my_elevated_button.dart';
import 'package:friendship_love_hate/widget/my_header.dart';
import 'package:friendship_love_hate/widget/my_page.dart';

class MaleDetailPage extends StatefulWidget {
  MaleDetailPage({
    @required this.isFirstPage,
  });
  final bool isFirstPage;

  @override
  _MaleDetailPageState createState() => _MaleDetailPageState();
}

class _MaleDetailPageState extends State<MaleDetailPage> {
  bool get isFirstPage => widget.isFirstPage;

  onPressButton() {
    if (isFirstPage)
      Navigator.pushNamed(
        context,
        RouteName.femaleDetailPage,
        arguments: false,
      );
    else
      Navigator.pushNamed(
        context,
        RouteName.resultPage,
      );
  }

  String buttonText() {
    return isFirstPage ? 'Female' : 'View Results';
  }

  @override
  Widget build(BuildContext context) {
    return MyPage(
      appBar: MyAppBar(
        backgroundColor: Colors.blue[50],
      ),
      backgroundColor: Colors.blue[50],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyHeader(
            title: "Male Page",
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
