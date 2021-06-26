import 'package:flutter/material.dart' hide TextField;
import 'package:flutter/material.dart' as material;
import 'package:takasburada/constants/constants.dart';

class TextField extends StatelessWidget {
  final TextInputType? textInputType;
  final String hint;
  final TextEditingController? textEditingController;
  const TextField({
    Key? key,
    required this.hint,
    this.textInputType,
    this.textEditingController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: elevation,
      borderRadius: BorderRadius.circular(borderRadius),
      child: material.TextField(
        controller: textEditingController,
        keyboardType: textInputType,
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
