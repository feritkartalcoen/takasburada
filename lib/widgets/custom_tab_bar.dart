import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:takasburada/providers/tab_bar_provider.dart';
import 'package:takasburada/constants/constants.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        AnimatedPositioned(
          duration: Duration(milliseconds: tabBarIndicatorAnimationDuration),
          curve: Curves.ease,
          left: context.watch<TabBarProvider>().tabIndex == 0
              ? -containerPadding
              : tabBarIndicatorWidth(context),
          child: Material(
            elevation: tabBarIndicatorElevation,
            color: tabBarIndicatorColor,
            borderRadius: BorderRadius.circular(tabBarIndicatorBorderRadius),
            child: SizedBox(
              width: tabBarIndicatorWidth(context),
              height: tabBarIndicatorHeight,
            ),
          ),
        ),
        Container(
          height: tabBarHeight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: tabTitles
                .map(
                  (tabTitle) => Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(tabTitle == tabTitles[0]
                            ? tabBarIndicatorBorderRadius
                            : 0),
                        bottomRight: Radius.circular(tabTitle == tabTitles[0]
                            ? tabBarIndicatorBorderRadius
                            : 0),
                        topLeft: Radius.circular(tabTitle == tabTitles[0]
                            ? 0
                            : tabBarIndicatorBorderRadius),
                        bottomLeft: Radius.circular(tabTitle == tabTitles[0]
                            ? 0
                            : tabBarIndicatorBorderRadius),
                      ),
                      child: Container(
                        width: tabBarItemWidth(context),
                        alignment: Alignment.center,
                        child: Text(
                          tabTitle,
                          style: tabTitleTextStyle,
                        ),
                      ),
                      onTap: () => context.read<TabBarProvider>().setTabIndex(
                            tabTitles.indexOf(tabTitle),
                          ),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}

List<String> tabTitles = [
  "sign up",
  "sign in",
];