import 'package:flutter/material.dart';
import 'package:takasburada/constants/constants.dart';

class CustomColoredButton extends StatelessWidget {
  final String text;
  final bool isPrimary;
  final VoidCallback onTap;
  const CustomColoredButton({
    Key? key,
    required this.text,
    required this.onTap,
    required this.isPrimary,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: isPrimary ? primaryButtonColor : secondaryButtonColor,
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
            style:
                isPrimary ? primaryButtonTextStyle : secondaryButtonTextStyle,
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}