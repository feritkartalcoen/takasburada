import 'package:flutter/material.dart';
import 'package:takasburada/constants/constants.dart';

class BorderedTextField extends StatelessWidget {
  final String hint;
  final TextEditingController? textEditingController;
  const BorderedTextField({
    Key? key,
    required this.hint,
    this.textEditingController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: textFieldHintTextStyle,
        contentPadding: EdgeInsets.only(left: 24),
        enabled: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(textFieldBorderRadius),
          borderSide: BorderSide(
            color: customBorderedTextFieldBorderColor,
            width: textFieldBorderWidth,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(textFieldBorderRadius),
          borderSide: BorderSide(
            color: customBorderedTextFieldBorderColor,
            width: textFieldBorderWidth,
          ),
        ),
      ),
    );
  }
}
