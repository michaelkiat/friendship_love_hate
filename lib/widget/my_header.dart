import 'package:flutter/material.dart';

import '../util/dimension_utils.dart';
import '../util/font_size_utils.dart';

enum HeaderType {
  header1,
  header2,
  header3,
  subheader,
  subheader2,
}

class MyHeader extends StatelessWidget {
  MyHeader({
    this.title,
    this.textAlign,
    this.bold = true,
    this.padding,
    this.headerType,
    this.textStyle,
  });
  final String title;
  final TextAlign textAlign;
  final bool bold;
  final EdgeInsets padding;
  final HeaderType headerType;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    EdgeInsets headerPadding() {
      double left = DimensionUtils.dp_16;
      double right = DimensionUtils.dp_16;
      double top = 0.0;
      double bottom = DimensionUtils.dp_16;

      switch (headerType) {
        case HeaderType.header1:
          top = DimensionUtils.dp_48;
          break;
        case HeaderType.header2:
          top = DimensionUtils.dp_32;
          break;
        case HeaderType.header3:
          top = DimensionUtils.dp_24;
          break;
        case HeaderType.subheader:
        case HeaderType.subheader2:
          top = DimensionUtils.dp_16;
          break;
        default:
          top = DimensionUtils.dp_48;
          break;
      }
      return EdgeInsets.fromLTRB(left, top, right, bottom);
    }

    double fontSize() {
      switch (headerType) {
        case HeaderType.header1:
          return FontSizeUtils.large;
        case HeaderType.header2:
          return FontSizeUtils.mediumLarge;
        case HeaderType.header3:
          return FontSizeUtils.medium;
        case HeaderType.subheader:
          return FontSizeUtils.mediumSmall;
        case HeaderType.subheader2:
          return FontSizeUtils.small;
        default:
          return FontSizeUtils.large;
      }
    }

    return Padding(
      padding: padding ?? headerPadding(),
      child: Text(
        title,
        style: textStyle ??
            TextStyle(
              fontWeight: bold ? FontWeight.bold : FontWeight.normal,
              fontSize: fontSize(),
            ),
        textAlign: textAlign ?? TextAlign.left,
      ),
    );
  }
}
