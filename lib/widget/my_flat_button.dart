import 'package:flutter/material.dart';
import 'package:friendship_love_hate/util/dimension_utils.dart';
import 'package:friendship_love_hate/util/font_size_utils.dart';

class MyFlatButton extends StatelessWidget {
  MyFlatButton({
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
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.pinkAccent),
          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          overlayColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.hovered))
                return Colors.white;
              if (states.contains(MaterialState.focused) ||
                  states.contains(MaterialState.pressed))
                return Colors.white.withOpacity(0.2);
              return null; // Defer to the widget's default.
            },
          ),
        ),
        onPressed: onPressed,
        child: Container(
          decoration: decoration,
          height: DimensionUtils.dp_32,
          width: double.infinity,
          child: Center(
            child: child ??
                Text(
                  buttonText?.toUpperCase() ?? 'FLAT BUTTON',
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: FontSizeUtils.button,
                  ),
                  textAlign: TextAlign.center,
                ),
          ),
        ),
      ),
    );
  }
}
