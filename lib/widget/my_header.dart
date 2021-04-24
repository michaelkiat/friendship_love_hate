import 'package:flutter/material.dart';

import '../util/dimension_utils.dart';
import '../util/font_size_utils.dart';

class MyHeader extends StatelessWidget {
  MyHeader({
    this.title,
    this.textAlign,
    this.fontSize = FontSizeUtils.large,
    this.bold = true,
    this.padding,
  });
  final String title;
  final TextAlign textAlign;
  final double fontSize;
  final bool bold;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.all(DimensionUtils.dp_16),
      child: Text(
        title,
        style: TextStyle(
          fontWeight: bold ? FontWeight.bold : FontWeight.normal,
          fontSize: fontSize,
        ),
        textAlign: textAlign ?? TextAlign.left,
      ),
    );
  }
}
