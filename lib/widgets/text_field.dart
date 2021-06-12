import 'package:flutter/material.dart' hide TextField;
import 'package:flutter/material.dart' as material;
import 'package:takasburada/constants/constants.dart';

class TextField extends StatelessWidget {
  final String hint;
  const TextField({
    Key? key,
    required this.hint,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: elevation,
      borderRadius: BorderRadius.circular(textFieldBorderRadius),
      child: material.TextField(
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: textFieldHintTextStyle,
          contentPadding: EdgeInsets.only(left: 24),
          enabled: true,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
      ),
    );
  }
}
