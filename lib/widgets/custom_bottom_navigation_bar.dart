import 'package:flutter/material.dart';
import 'package:takasburada/constants/constants.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: bottomNavigationBarElevation,
      borderRadius: BorderRadius.circular(bottomNavigationBarBorderRadius),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(bottomNavigationBarBorderRadius),
        child: Container(
          height: bottomAppBarHeight,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: icons
                .map(
                  (icon) => Material(
                    color: Colors.transparent,
                    child: InkWell(
                      child: Container(
                        width: bottomNavigationBarItemWidth(context),
                        child: Image.asset(icon),
                      ),
                      onTap: () {},
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}

List<String> icons = [
  "images/feed.png",
  "images/search.png",
  "images/messages.png",
];
