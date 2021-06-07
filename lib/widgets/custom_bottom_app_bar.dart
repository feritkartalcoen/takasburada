import 'package:flutter/material.dart';
import 'package:takasburada/constants/constants.dart';
import 'package:takasburada/widgets/custom_bottom_navigation_bar.dart';

class CustomBottomAppBar extends StatelessWidget {
  final Widget floatingActionButton;
  const CustomBottomAppBar({
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
            child: CustomBottomNavigationBar(),
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
