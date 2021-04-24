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
  });
  final Function() onPressed;
  final String buttonText;
  final Widget child;
  final EdgeInsets padding;
  final Decoration decoration;

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
                  buttonText ?? 'Elevated Button',
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: FontSizeUtils.medium,
                  ),
                  textAlign: TextAlign.center,
                ),
          ),
        ),
      ),
    );
  }
}
