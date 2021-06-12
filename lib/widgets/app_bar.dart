import 'package:flutter/material.dart';
import 'package:takasburada/constants/constants.dart';

class AppBar extends StatelessWidget {
  final List<Widget> children;
  final bool withTitle;
  const AppBar({
    Key? key,
    required this.children,
    this.withTitle = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(containerPadding),
      width: double.infinity,
      height: withTitle ? appBarHeight : appBarHeight + 12,
      alignment: Alignment.centerLeft,
      child: Row(
        children: children,
      ),
    );
  }
}
