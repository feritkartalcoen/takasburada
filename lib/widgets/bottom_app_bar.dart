import 'package:flutter/material.dart' hide BottomNavigationBar;
import 'package:takasburada/constants/constants.dart';
import 'package:takasburada/widgets/bottom_navigation_bar.dart';

class BottomAppBar extends StatelessWidget {
  final Widget floatingActionButton;
  const BottomAppBar({
    Key? key,
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
          Expanded(
            child: BottomNavigationBar(),
          ),
          SizedBox(
            width: containerPadding,
          ),
          floatingActionButton,
        ],
      ),
    );
  }
}
