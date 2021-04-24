import 'package:flutter/material.dart';
import 'package:friendship_love_hate/core/router/route_name.dart';
import 'package:friendship_love_hate/model/form_model.dart';
import 'package:friendship_love_hate/util/color_utils.dart';
import 'package:friendship_love_hate/widget/my_app_bar.dart';
import 'package:friendship_love_hate/widget/my_elevated_button.dart';
import 'package:friendship_love_hate/widget/my_header.dart';
import 'package:friendship_love_hate/widget/my_page.dart';
import 'package:friendship_love_hate/widget/my_text.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => FormModel(),
      builder: (context, widget) {
        return MyPage(
          appBar: MyAppBar(
            backgroundColor: ColorUtils.lightTeal,
          ),
          backgroundColor: ColorUtils.lightTeal,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyHeader(
                title: "Friendship, Love or Hate",
                textAlign: TextAlign.center,
              ),
              MyText('Select your gender'),
              MyElevatedButton(
                buttonText: 'Male',
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    RouteName.maleDetailPage,
                    arguments: true,
                  );
                },
              ),
              MyElevatedButton(
                buttonText: 'Female',
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    RouteName.femaleDetailPage,
                    arguments: true,
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
