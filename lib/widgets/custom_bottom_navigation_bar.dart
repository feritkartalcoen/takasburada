import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:takasburada/constants/constants.dart';
import 'package:takasburada/providers/bottom_navigation_bar_provider.dart';

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
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              AnimatedPositioned(
                duration: Duration(
                    milliseconds:
                        bottomNavigationBarIndicatorAnimationDuration),
                curve: Curves.ease,
                left: context
                        .watch<BottomNavigationBarProvider>()
                        .bottomNavigationIndex *
                    bottomNavigationBarIndicatorWidth(context),
                child: Container(
                  color: bottomNavigationBarColor,
                  width: bottomNavigationBarIndicatorWidth(context),
                  height: bottomNavigationBarIndicatorHeight,
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: bottomNavigationBarItemIcons
                    .map(
                      (bottomNavigationBarItemIcon) => Material(
                        color: Colors.transparent,
                        child: InkWell(
                          child: Container(
                            width: bottomNavigationBarItemWidth(context),
                            child: Image.asset(bottomNavigationBarItemIcon),
                          ),
                          onTap: () {
                            context
                                .read<BottomNavigationBarProvider>()
                                .setbottomNavigationIndex(
                                    bottomNavigationBarItemIcons
                                        .indexOf(bottomNavigationBarItemIcon));
                          },
                        ),
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

List<String> bottomNavigationBarItemIcons = [
  "images/feed.png",
  "images/search.png",
  "images/messages.png",
];
