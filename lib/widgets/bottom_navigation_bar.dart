import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:takasburada/constants/constants.dart';
import 'package:takasburada/providers/providers.dart' as providers;

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
                duration: Duration(milliseconds: bottomNavigationBarIndicatorAnimationDuration),
                curve: Curves.ease,
                left: context.watch<providers.IndexProvider>().bottomNavigationIndex * bottomNavigationBarIndicatorWidth(context),
                child: Container(
                  color: bottomNavigationBarColor,
                  width: bottomNavigationBarIndicatorWidth(context),
                  height: bottomNavigationBarIndicatorHeight,
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: icons!
                    .map((icon) => Material(
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
                              context.read<providers.IndexProvider>().bottomNavigationIndex = icons!.indexOf(icon!);
                            },
                          ),
                        ))
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
