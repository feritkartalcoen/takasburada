import 'package:flutter/material.dart';
import 'package:takasburada/constants/constants.dart';

class AppTitle extends StatelessWidget {
  const AppTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: titleTextStyle,
      textAlign: TextAlign.center,
    );
  }
}
