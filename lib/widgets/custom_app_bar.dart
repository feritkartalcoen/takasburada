import 'package:flutter/material.dart';
import 'package:takasburada/constants/constants.dart';

class CustomAppBar extends StatelessWidget {
  final List<Widget> children;
  const CustomAppBar({
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
