import 'package:flutter/material.dart';
import 'package:friendship_love_hate/util/dimension_utils.dart';
import 'package:friendship_love_hate/util/font_size_utils.dart';

class MyTextField extends StatelessWidget {
  MyTextField({
    this.controller,
    this.labelText,
    this.textCapitalization,
    this.readOnly,
    this.padding,
    this.hintText,
    this.onChanged,
    this.onPressClear,
  });
  final TextEditingController controller;
  final String labelText;
  final TextCapitalization textCapitalization;
  final bool readOnly;
  final EdgeInsets padding;
  final String hintText;
  final Function(String) onChanged;
  final Function() onPressClear;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.all(DimensionUtils.dp_16),
      child: TextField(
        readOnly: readOnly ?? false,
        decoration: InputDecoration(
          border: UnderlineInputBorder(),
          hintText: hintText,
          labelText: labelText,
          suffixIcon: IconButton(
            onPressed: onPressClear,
            icon: Icon(Icons.clear),
          ),
        ),
        style: TextStyle(
          fontSize: FontSizeUtils.mediumSmall,
        ),
        controller: controller,
        textCapitalization: textCapitalization ?? TextCapitalization.words,
        onChanged: onChanged,
      ),
    );
  }
}
