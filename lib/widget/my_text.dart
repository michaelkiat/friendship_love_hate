import 'package:flutter/material.dart';
import 'package:friendship_love_hate/util/dimension_utils.dart';
import 'package:friendship_love_hate/util/font_size_utils.dart';

class MyText extends StatelessWidget {
  MyText(
    this.text, {
    this.textStyle,
    this.textColor,
    this.padding,
    this.textAlign,
  });
  final String text;
  final TextStyle textStyle;
  final Color textColor;
  final EdgeInsets padding;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ??
          EdgeInsets.fromLTRB(
            DimensionUtils.dp_16,
            DimensionUtils.dp_8,
            DimensionUtils.dp_16,
            DimensionUtils.dp_8,
          ),
      child: Text(
        text,
        style: textStyle ??
            TextStyle(
              fontSize: FontSizeUtils.mediumSmall,
              color: textColor ?? Colors.black,
            ),
            textAlign: textAlign,
      ),
    );
  }
}
