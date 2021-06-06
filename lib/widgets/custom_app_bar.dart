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
      margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      padding: EdgeInsets.all(containerPadding),
      width: double.infinity,
      alignment: Alignment.centerLeft,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: children,
      ),
    );
  }
}
