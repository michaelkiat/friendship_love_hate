import 'package:flutter/material.dart';

class MyPage extends StatelessWidget {
  MyPage({
    this.body,
    this.backgroundColor,
    this.bottomNavigationBar,
    this.appBar,
  });
  final Widget body;
  final Color backgroundColor;
  final Widget bottomNavigationBar;
  final PreferredSizeWidget appBar;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appBar,
        backgroundColor: backgroundColor ?? Colors.pink[50],
        body: body,
        bottomNavigationBar: bottomNavigationBar,
      ),
    );
  }
}
