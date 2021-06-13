import 'package:flutter/material.dart';
import 'package:takasburada/constants/constants.dart';

class Title extends StatelessWidget {
  const Title({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: RichText(
        text: TextSpan(
          style: titleTextStyle,
          children: title
              .split(" ")
              .map(
                (text) => TextSpan(
                  text: text,
                  style: text == title.split(" ").first
                      ? titleFirstTextStyle
                      : titleSecondTextStyle,
                ),
              )
              .toList(),
        ),
      ),
      /* child: Text(
        title,
        style: titleTextStyle,
        textAlign: TextAlign.center,
      ), */
    );
  }
}
