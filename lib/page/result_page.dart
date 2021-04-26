import 'dart:math';

import 'package:flutter/material.dart';
import 'package:friendship_love_hate/core/router/route_name.dart';
import 'package:friendship_love_hate/model/form_model.dart';
import 'package:friendship_love_hate/util/color_utils.dart';
import 'package:friendship_love_hate/util/dimension_utils.dart';
import 'package:friendship_love_hate/widget/my_elevated_button.dart';
import 'package:friendship_love_hate/widget/my_header.dart';
import 'package:friendship_love_hate/widget/my_page.dart';
import 'package:friendship_love_hate/widget/my_text.dart';
import 'package:provider/provider.dart';
import 'package:lottie/lottie.dart';

class ResultPage extends StatefulWidget {
  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  String get maleName =>
      Provider.of<FormModel>(context, listen: false).maleName;
  String get femaleName =>
      Provider.of<FormModel>(context, listen: false).femaleName;

  SliverList renderFriendSliver() {
    return SliverList(
      delegate: SliverChildListDelegate([
        Lottie.asset(
          'assets/lottie/friend.json',
        ),
        MyHeader(
          title: 'FRIENDS',
          padding: EdgeInsets.fromLTRB(
            DimensionUtils.dp_32,
            DimensionUtils.dp_0,
            DimensionUtils.dp_32,
            DimensionUtils.dp_0,
          ),
        ),
        MyText(
          'At most, both of you are a couple of besties. You are already deep into the friendzone. I would suggest you to accept this faith, climb back up from the hole of darkness and move on.',
          padding: EdgeInsets.fromLTRB(
            DimensionUtils.dp_32,
            DimensionUtils.dp_16,
            DimensionUtils.dp_32,
            DimensionUtils.dp_16,
          ),
        ),
      ]),
    );
  }

  SliverList renderLoveSliver() {
    return SliverList(
      delegate: SliverChildListDelegate([
        Lottie.asset(
          'assets/lottie/love.json',
        ),
        MyHeader(
          title: 'LOVERS',
          padding: EdgeInsets.fromLTRB(
            DimensionUtils.dp_32,
            DimensionUtils.dp_0,
            DimensionUtils.dp_32,
            DimensionUtils.dp_0,
          ),
        ),
        MyText(
          'Both of you are getting married soon! Congratulations. Now, save up some money so that the both of you could afford a baby.',
          padding: EdgeInsets.fromLTRB(
            DimensionUtils.dp_32,
            DimensionUtils.dp_16,
            DimensionUtils.dp_32,
            DimensionUtils.dp_16,
          ),
        ),
      ]),
    );
  }

  SliverList renderHateSliver() {
    return SliverList(
      delegate: SliverChildListDelegate([
        Lottie.asset(
          'assets/lottie/hate.json',
        ),
        MyHeader(
          title: 'WARZONE',
          padding: EdgeInsets.fromLTRB(
            DimensionUtils.dp_32,
            DimensionUtils.dp_32,
            DimensionUtils.dp_32,
            DimensionUtils.dp_0,
          ),
        ),
        MyText(
          'Peace, friendship, and love have never been an option for the both of you. Hate and discrimination will always be practiced between you both, just like how the world is fighting and discriminating the poor COVID-19 virus.',
          padding: EdgeInsets.fromLTRB(
            DimensionUtils.dp_32,
            DimensionUtils.dp_16,
            DimensionUtils.dp_32,
            DimensionUtils.dp_16,
          ),
        ),
      ]),
    );
  }

  SliverList displayResultRandomly() {
    Random random = Random();
    int randomInt = random.nextInt(3);
    if (randomInt == 0) return renderFriendSliver();
    if (randomInt == 1) return renderLoveSliver();
    return renderHateSliver();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: MyPage(
        backgroundColor: ColorUtils.lightTeal,
        body: CustomScrollView(
          slivers: [
            displayResultRandomly(),
          ],
        ),
        bottomNavigationBar: MyElevatedButton(
          buttonText: 'GOT IT',
          onPressed: () {
            context.read<FormModel>().clearData();
            Navigator.popUntil(
              context,
              ModalRoute.withName(RouteName.homePage),
            );
          },
        ),
      ),
    );
  }
}
