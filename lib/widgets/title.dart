import 'package:flutter/material.dart';
import 'package:takasburada/constants/constants.dart';

class Title extends StatelessWidget {
  const Title({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Text(
        title,
        style: titleTextStyle,
        textAlign: TextAlign.center,
      ),
    );
  }
}
