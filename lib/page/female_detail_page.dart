import 'dart:async';

import 'package:flutter/material.dart';
import 'package:friendship_love_hate/constant.dart';
import 'package:friendship_love_hate/core/router/route_name.dart';
import 'package:friendship_love_hate/model/form_model.dart';
import 'package:friendship_love_hate/model/name_description_model.dart';
import 'package:friendship_love_hate/util/color_utils.dart';
import 'package:friendship_love_hate/util/dimension_utils.dart';
import 'package:friendship_love_hate/util/reg_utils.dart';
import 'package:friendship_love_hate/widget/my_app_bar.dart';
import 'package:friendship_love_hate/widget/my_elevated_button.dart';
import 'package:friendship_love_hate/widget/my_header.dart';
import 'package:friendship_love_hate/widget/my_page.dart';
import 'package:friendship_love_hate/widget/my_text.dart';
import 'package:friendship_love_hate/widget/my_text_field.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class FemaleDetailPage extends StatefulWidget {
  FemaleDetailPage({
    @required this.isFirstPage,
  });
  final bool isFirstPage;

  @override
  _FemaleDetailPageState createState() => _FemaleDetailPageState();
}

class _FemaleDetailPageState extends State<FemaleDetailPage> {
  TextEditingController nameController;
  String _displayNameDescription = '';
  Timer _debounce;
  bool _isError = false;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: '');
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  bool get isFirstPage => widget.isFirstPage;

  bool isNameValid() {
    if (nameController.text.isEmpty) {
      setState(() {
        _displayNameDescription =
            "Please ensure that you have filled up the form.";
        _isError = true;
      });
      return false;
    }
    if (!RegUtils.alphabetic.hasMatch(nameController.text)) {
      setState(() {
        _displayNameDescription =
            "Please ensure the name entered is alphabetic.";
        _isError = true;
      });
      return false;
    }
    return true;
  }

  onPressButton(BuildContext context) {
    if (!isNameValid()) return;

    context.read<FormModel>().setFemaleName(nameController.text);
    if (isFirstPage)
      Navigator.pushNamed(
        context,
        RouteName.maleDetailPage,
        arguments: false,
      );
    else
      Navigator.pushNamed(
        context,
        RouteName.resultPage,
      );
  }

  String get buttonText => isFirstPage ? 'Proceed' : 'View Results';
  String get pageTitle =>
      isFirstPage ? 'Hello, Lady' : 'Do you recall her name?';
  String get welcomeText => isFirstPage
      ? 'So, what did your parents name you?'
      : 'What is her name then?';

  void generateNameDescription() {
    if (_debounce?.isActive ?? false) _debounce.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      String generatedDesc = NameDescriptionModel.generateNameDescription(
        name: nameController.text,
        gender: Gender.FEMALE,
      );
      if (isNameValid()) {
        if (mounted)
          setState(() {
            _isError = false;
            _displayNameDescription = generatedDesc;
          });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MyPage(
      appBar: MyAppBar(
        backgroundColor: ColorUtils.lightPink,
      ),
      backgroundColor: ColorUtils.lightPink,
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate([
              Lottie.asset(
                'assets/lottie/female.json',
                height: 250,
              ),
              MyHeader(
                title: pageTitle,
                textAlign: TextAlign.left,
                headerType: HeaderType.header2,
                padding: EdgeInsets.fromLTRB(
                  DimensionUtils.dp_16,
                  DimensionUtils.dp_16,
                  DimensionUtils.dp_16,
                  DimensionUtils.dp_16,
                ),
              ),
              MyText(welcomeText),
              MyTextField(
                hintText: 'Name',
                controller: nameController,
                onChanged: (name) {
                  generateNameDescription();
                },
                onPressClear: () {
                  setState(() {
                    nameController.clear();
                    _displayNameDescription = '';
                  });
                },
              ),
              MyText(
                _displayNameDescription,
                textColor: _isError ? Colors.red : Colors.black,
              ),
            ]),
          ),
        ],
      ),
      bottomNavigationBar: MyElevatedButton(
        buttonText: buttonText,
        onPressed: () => onPressButton(context),
        backgroundColor: ColorUtils.pink,
      ),
    );
  }
}
