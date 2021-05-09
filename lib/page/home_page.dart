import 'package:flutter/material.dart';
import 'package:friendship_love_hate/core/router/route_name.dart';
import 'package:friendship_love_hate/model/form_model.dart';
import 'package:friendship_love_hate/util/color_utils.dart';
import 'package:friendship_love_hate/util/dimension_utils.dart';
import 'package:friendship_love_hate/util/font_size_utils.dart';
import 'package:friendship_love_hate/widget/my_app_bar.dart';
import 'package:friendship_love_hate/widget/my_page.dart';
import 'package:friendship_love_hate/widget/my_text.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget renderGenderSelectionCard() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: EdgeInsets.only(left: DimensionUtils.dp_16),
          child: Card(
            color: ColorUtils.lightBlue,
            child: InkWell(
              splashColor: ColorUtils.blue,
              onTap: () {
                Navigator.pushNamed(
                  context,
                  RouteName.maleDetailPage,
                  arguments: true,
                );
              },
              child: Column(
                children: [
                  Lottie.asset(
                    'assets/lottie/male.json',
                    height: 150,
                    width: MediaQuery.of(context).size.width / 2 -
                        DimensionUtils.dp_32,
                  ),
                  MyText('I am a male'),
                  SizedBox(height: DimensionUtils.dp_16)
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: DimensionUtils.dp_16),
          child: Card(
            color: ColorUtils.lightPink,
            child: InkWell(
              splashColor: ColorUtils.pink,
              onTap: () {
                Navigator.pushNamed(
                  context,
                  RouteName.femaleDetailPage,
                  arguments: true,
                );
              },
              child: Column(
                children: [
                  Lottie.asset(
                    'assets/lottie/female.json',
                    height: 150,
                    width: MediaQuery.of(context).size.width / 2 -
                        DimensionUtils.dp_32,
                  ),
                  MyText('I am a female'),
                  SizedBox(height: DimensionUtils.dp_16)
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget renderAppDetails() {
    return MyText(
      'OfficialRubbishTech • v1.0.0',
      textStyle: TextStyle(
        fontSize: FontSizeUtils.small,
      ),
      textAlign: TextAlign.center,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => FormModel(),
      builder: (context, widget) {
        return MyPage(
          appBar: MyAppBar(
            backgroundColor: ColorUtils.logoBackground,
          ),
          backgroundColor: ColorUtils.logoBackground,
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image(
                  image: AssetImage('assets/logo/logo.png'),
                  width: 300.0,
                  height: 300.0,
                ),
                renderGenderSelectionCard(),
              ],
            ),
          ),
          bottomNavigationBar: Container(
            child: renderAppDetails(),
          ),
        );
      },
    );
  }
}
