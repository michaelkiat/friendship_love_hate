import 'dart:async';

import 'package:flutter/material.dart';
import 'package:friendship_love_hate/constant.dart';
import 'package:friendship_love_hate/core/router/route_name.dart';
import 'package:friendship_love_hate/model/form_model.dart';
import 'package:friendship_love_hate/model/name_description_model.dart';
import 'package:friendship_love_hate/util/reg_utils.dart';
import 'package:friendship_love_hate/widget/my_app_bar.dart';
import 'package:friendship_love_hate/widget/my_elevated_button.dart';
import 'package:friendship_love_hate/widget/my_header.dart';
import 'package:friendship_love_hate/widget/my_page.dart';
import 'package:friendship_love_hate/widget/my_text.dart';
import 'package:friendship_love_hate/widget/my_text_field.dart';
import 'package:provider/provider.dart';

class MaleDetailPage extends StatefulWidget {
  MaleDetailPage({
    @required this.isFirstPage,
  });
  final bool isFirstPage;

  @override
  _MaleDetailPageState createState() => _MaleDetailPageState();
}

class _MaleDetailPageState extends State<MaleDetailPage> {
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

    context.read<FormModel>().setMaleName(nameController.text);
    if (isFirstPage)
      Navigator.pushNamed(
        context,
        RouteName.femaleDetailPage,
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
      isFirstPage ? 'Hello, Gentleman' : 'Now, don\'t be shy';
  String get welcomeText => isFirstPage
      ? 'So, what did your parents name you?'
      : 'Who is this handsome lad that you liked a lot?';

  void generateNameDescription() {
    if (_debounce?.isActive ?? false) _debounce.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      String generatedDesc = NameDescriptionModel.generateNameDescription(
        name: nameController.text,
        gender: Gender.MALE,
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
        backgroundColor: Colors.blue[50],
      ),
      backgroundColor: Colors.blue[50],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyHeader(
            title: pageTitle,
            textAlign: TextAlign.left,
            headerType: HeaderType.header2,
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
        ],
      ),
      bottomNavigationBar: MyElevatedButton(
        buttonText: buttonText,
        onPressed: () => onPressButton(context),
      ),
    );
  }
}
