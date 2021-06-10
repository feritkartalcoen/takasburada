import 'package:flutter/material.dart';
import 'package:takasburada/constants/constants.dart';

class CustomLabel extends StatelessWidget {
  final String label;
  const CustomLabel({
    Key? key,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: labelTextStyle,
    );
  }
}
