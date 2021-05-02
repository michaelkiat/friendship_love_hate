import 'package:flutter/material.dart';
import 'package:friendship_love_hate/util/color_utils.dart';

enum Result {
  friendship,
  love,
  hate,
}

class ResultModel {
  static Result calculateResult({
    @required String maleName,
    @required String femaleName,
  }) {
    List<String> maleNameSplitByWhiteSpace = maleName.trim().split(' ');
    int maleNameLength = maleNameSplitByWhiteSpace.length;

    List<String> femaleNameSplitByWhiteSpace = femaleName.trim().split(' ');
    int femaleNameLength = femaleNameSplitByWhiteSpace.length;

    int totalNameLength = maleNameLength + femaleNameLength;

    for (int i = 1; i <= totalNameLength; i += 3) {
      if (i > totalNameLength) break;
      if (totalNameLength == i) return Result.friendship;
    }
    for (int i = 2; i <= totalNameLength; i += 3) {
      if (i > totalNameLength) break;
      if (totalNameLength == i) return Result.love;
    }
    return Result.hate;
  }

  static Color backgroundColor({
    @required String maleName,
    @required String femaleName,
  }) {
    Result result = ResultModel.calculateResult(
      maleName: maleName,
      femaleName: femaleName,
    );
    if (result == Result.friendship) return ColorUtils.friendship;
    if (result == Result.love) return ColorUtils.love;
    return ColorUtils.hate;
  }
}
