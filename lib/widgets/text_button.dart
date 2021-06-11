import 'package:flutter/material.dart';
import 'package:takasburada/constants/constants.dart';

class TextButton extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  const TextButton({
    Key? key,
    required this.text,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(textButtonBorderRadius),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: containerPadding / 2),
          height: textButtonHeight,
          alignment: Alignment.center,
          child: Text(
            text,
            style: textButtonTextStyle,
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}
