import 'package:flutter/material.dart';
import 'package:takasburada/constants/constants.dart';

class Label extends StatelessWidget {
  final String label;
  const Label({
    Key? key,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(label, style: labelTextStyle);
  }
}
