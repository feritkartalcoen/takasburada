import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:takasburada/providers/providers.dart' as providers;
import 'package:takasburada/constants/constants.dart';

class TabBar extends StatelessWidget {
  const TabBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        AnimatedPositioned(
          duration: Duration(milliseconds: tabBarIndicatorAnimationDuration),
          curve: Curves.ease,
          left: context.watch<providers.IndexProvider>().tabIndex == 0 ? -containerPadding : tabBarIndicatorWidth(context),
          child: Material(
            elevation: elevation,
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
            children: tabBarItemTitles
                .map(
                  (tabBarItemTitle) => Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(tabBarItemTitle == tabBarItemTitles[0] ? tabBarIndicatorBorderRadius : 0),
                        bottomRight: Radius.circular(tabBarItemTitle == tabBarItemTitles[0] ? tabBarIndicatorBorderRadius : 0),
                        topLeft: Radius.circular(tabBarItemTitle == tabBarItemTitles[0] ? 0 : tabBarIndicatorBorderRadius),
                        bottomLeft: Radius.circular(tabBarItemTitle == tabBarItemTitles[0] ? 0 : tabBarIndicatorBorderRadius),
                      ),
                      child: Container(
                        width: tabBarItemWidth(context),
                        alignment: Alignment.center,
                        child: Text(
                          tabBarItemTitle,
                          style: tabTitleTextStyle,
                        ),
                      ),
                      onTap: () => context.read<providers.IndexProvider>().tabIndex = tabBarItemTitles.indexOf(tabBarItemTitle),
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

List<String> tabBarItemTitles = [
  "sign up",
  "sign in",
];
