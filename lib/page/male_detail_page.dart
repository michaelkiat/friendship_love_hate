import 'package:flutter/material.dart';
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
