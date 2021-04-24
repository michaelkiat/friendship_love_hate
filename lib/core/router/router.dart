import 'package:flutter/material.dart';
import 'package:friendship_love_hate/core/router/route_name.dart';

// Page
import 'package:friendship_love_hate/page/index.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.homePage:
        return MaterialPageRoute(
          builder: (_) => HomePage(),
          settings: settings,
        );
      case RouteName.maleDetailPage:
        return MaterialPageRoute(
          builder: (_) => MaleDetailPage(
            isFirstPage: settings.arguments,
          ),
          settings: settings,
        );
      case RouteName.femaleDetailPage:
        return MaterialPageRoute(
          builder: (_) => FemaleDetailPage(
            isFirstPage: settings.arguments,
          ),
          settings: settings,
        );
      case RouteName.resultPage:
        return MaterialPageRoute(
          builder: (_) => ResultPage(),
          settings: settings,
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
