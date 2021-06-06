import 'package:flutter/material.dart';
import 'package:takasburada/constants/constants.dart';

class CustomTitle extends StatelessWidget {
  const CustomTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        alignment: Alignment.center,
        child: Text(
          title,
          style: titleTextStyle,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
