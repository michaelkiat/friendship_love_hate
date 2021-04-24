import 'package:flutter/material.dart' hide Router;
import 'package:friendship_love_hate/core/router/route_name.dart';
import 'package:friendship_love_hate/core/router/router.dart';
import 'package:friendship_love_hate/model/form_model.dart';
import 'package:friendship_love_hate/page/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (_) {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.focusedChild?.unfocus();
        }
      },
      child: ChangeNotifierProvider<FormModel>(
        create: (context) => FormModel(),
        child: MaterialApp(
          title: 'Flutter Demo',
          onGenerateRoute: Router.generateRoute,
          initialRoute: RouteName.homePage,
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: HomePage(),
          // MyHomePage(title: 'Flutter Demo Home Page'),
        ),
      ),
    );
  }
}
