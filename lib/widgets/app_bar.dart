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
      padding: EdgeInsets.fromLTRB(
        containerPadding,
        containerPadding + MediaQuery.of(context).padding.top,
        containerPadding,
        containerPadding,
      ),
      width: double.infinity,
      height: withTitle ? appBarHeight + MediaQuery.of(context).padding.top : appBarHeight + MediaQuery.of(context).padding.top + 12,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: children,
      ),
    );
  }
}
