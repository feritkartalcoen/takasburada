import 'package:flutter/material.dart';
import 'package:takasburada/constants/constants.dart';

class Chip extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const Chip({
    Key? key,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: elevation,
      shape: StadiumBorder(),
      child: InkWell(
        customBorder: StadiumBorder(),
        child: Container(
          height: chipHeight,
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(horizontal: containerPadding),
          child: Text(text, style: chipTextStyle),
        ),
        onTap: onTap,
      ),
    );
  }
}
