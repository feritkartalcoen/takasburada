import 'package:flutter/material.dart';
import 'package:takasburada/constants/constants.dart';

class PrimaryColoredButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const PrimaryColoredButton({
    Key? key,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: primaryColoredButtonColor,
      elevation: buttonElevation,
      borderRadius: BorderRadius.all(
        Radius.circular(buttonBorderRadius),
      ),
      child: InkWell(
        borderRadius: BorderRadius.all(
          Radius.circular(buttonBorderRadius),
        ),
        child: Container(
          width: double.infinity,
          height: buttonHeight,
          alignment: Alignment.center,
          child: Text(
            text,
            style: primaryColoredButtonTextStyle,
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}
