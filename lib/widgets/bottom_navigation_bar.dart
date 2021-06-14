import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:takasburada/constants/constants.dart';
import 'package:takasburada/providers/bottom_navigation_bar_provider.dart';

class BottomNavigationBar extends StatelessWidget {
  final List<IconData?>? icons;
  const BottomNavigationBar({
    Key? key,
    this.icons,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: elevation,
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
                children: icons!
                    .map(
                      (icon) => Material(
                        color: Colors.transparent,
                        child: InkWell(
                          child: Container(
                            width: bottomNavigationBarItemWidth(context),
                            child: Icon(
                              icon,
                              color: bottomNavigationBarIconColor,
                            ),
                          ),
                          onTap: () {
                            context
                                .read<BottomNavigationBarProvider>()
                                .setbottomNavigationIndex(
                                    icons!.indexOf(icon!));
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
