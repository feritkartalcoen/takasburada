import 'package:flutter/material.dart';
import 'package:takasburada/constants/constants.dart';

class CustomBorderedTextField extends StatelessWidget {
  final String hint;
  const CustomBorderedTextField({
    Key? key,
    required this.hint,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: textFieldHintTextStyle,
        contentPadding: EdgeInsets.only(left: 24),
        enabled: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(textFieldBorderRadius),
          borderSide: BorderSide(
            color: CustomBorderedTextFieldBorderColor,
            width: textFieldBorderWidth,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(textFieldBorderRadius),
          borderSide: BorderSide(
            color: CustomBorderedTextFieldBorderColor,
            width: textFieldBorderWidth,
          ),
        ),
      ),
    );
  }
}
