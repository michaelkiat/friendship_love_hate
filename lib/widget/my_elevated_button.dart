import 'package:flutter/material.dart';
import 'package:friendship_love_hate/util/dimension_utils.dart';
import 'package:friendship_love_hate/util/font_size_utils.dart';

class MyElevatedButton extends StatelessWidget {
  MyElevatedButton({
    @required this.onPressed,
    this.buttonText,
    this.child,
    this.padding,
    this.decoration,
    this.backgroundColor = Colors.blue,
    this.foregroundColor = Colors.white,
  });
  final Function() onPressed;
  final String buttonText;
  final Widget child;
  final EdgeInsets padding;
  final Decoration decoration;
  final Color backgroundColor;
  final Color foregroundColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.all(DimensionUtils.dp_16),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Container(
          decoration: decoration,
          height: DimensionUtils.dp_48,
          width: double.infinity,
          child: Center(
            child: child ??
                Text(
                  buttonText?.toUpperCase() ?? 'ELEVATED BUTTON',
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: FontSizeUtils.button,
                  ),
                  textAlign: TextAlign.center,
                ),
          ),
        ),
        style: ElevatedButton.styleFrom(
          primary: backgroundColor,
          onPrimary: foregroundColor,
        ),
      ),
    );
  }
}
