import 'package:flutter/material.dart' hide Router;
import 'package:friendship_love_hate/core/router/route_name.dart';
import 'package:friendship_love_hate/core/router/router.dart';
import 'package:friendship_love_hate/page/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      onGenerateRoute: Router.generateRoute,
      initialRoute: RouteName.homePage,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
      // MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
