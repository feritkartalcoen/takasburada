import 'package:flutter/material.dart' hide BottomNavigationBar;
import 'package:takasburada/constants/constants.dart';

class BottomAppBar extends StatelessWidget {
  final Widget child;
  final Widget floatingActionButton;
  const BottomAppBar({
    Key? key,
    required this.child,
    required this.floatingActionButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: bottomAppBarHeight,
      padding: EdgeInsets.all(containerPadding),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: child),
          SizedBox(width: containerPadding),
          floatingActionButton,
        ],
      ),
    );
  }
}
