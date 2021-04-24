import 'package:flutter/material.dart';
import 'package:friendship_love_hate/widget/my_app_bar.dart';
import 'package:friendship_love_hate/widget/my_header.dart';
import 'package:friendship_love_hate/widget/my_page.dart';

class MaleDetailPage extends StatefulWidget {
  @override
  _MaleDetailPageState createState() => _MaleDetailPageState();
}

class _MaleDetailPageState extends State<MaleDetailPage> {
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
          ),
        ],
      ),
    );
  }
}
