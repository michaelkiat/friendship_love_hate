import 'dart:math';

import 'package:flutter/material.dart';
import 'package:friendship_love_hate/constant.dart';

class NameDescriptionModel {
  static String generateNameDescription({
    @required String name,
    @required String gender,
  }) {
    return gender == Gender.MALE
        ? _generateMaleNameDescription(name)
        : _generateFemaleNameDescription(name);
  }

  static String _generateMaleNameDescription(String name) {
    String _name = name.trim();

    Random random = new Random();
    int randomInt = random.nextInt(3);
    List<String> possibleDescriptionList = [];

    if (_name.length < 8)
      possibleDescriptionList.addAll([
        MaleNameDescriptionLessThan8.description1,
        MaleNameDescriptionLessThan8.description2,
        MaleNameDescriptionLessThan8.description3,
      ]);
    else if (_name.length >= 8 && _name.length <= 12)
      possibleDescriptionList.addAll([
        MaleNameDescription8to12.description1,
        MaleNameDescription8to12.description2,
        MaleNameDescription8to12.description3,
      ]);
    else if (_name.length > 20)
      possibleDescriptionList.addAll([
        MaleNameDescriptionMoreThan20.description1,
        MaleNameDescriptionMoreThan20.description2,
        MaleNameDescriptionMoreThan20.description3,
      ]);
    else if (_name.length > 12)
      possibleDescriptionList.addAll([
        MaleNameDescriptionMoreThan12.description1,
        MaleNameDescriptionMoreThan12.description2,
        MaleNameDescriptionMoreThan12.description3,
      ]);
    return _name.length == 0
        ? ''
        : possibleDescriptionList.elementAt(randomInt);
  }

  static String _generateFemaleNameDescription(String name) {
    String _name = name.trim();

    Random random = new Random();
    int randomInt = random.nextInt(5);
    List<String> possibleDescriptionList = [
      FemaleNameDescription.description1,
      FemaleNameDescription.description2,
      FemaleNameDescription.description3,
      FemaleNameDescription.description4,
      FemaleNameDescription.description5,
    ];
    return _name.length == 0
        ? ''
        : possibleDescriptionList.elementAt(randomInt);
  }
}
