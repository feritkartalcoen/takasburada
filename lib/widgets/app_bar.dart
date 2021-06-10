import 'package:flutter/material.dart';
import 'package:takasburada/constants/constants.dart';

class AppBar extends StatelessWidget {
  final List<Widget> children;
  const AppBar({
    Key? key,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(containerPadding),
      width: double.infinity,
      height: appBarHeight,
      alignment: Alignment.centerLeft,
      child: Row(
        children: children,
      ),
    );
  }
}
