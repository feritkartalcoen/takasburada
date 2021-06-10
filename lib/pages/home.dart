import 'package:animations/animations.dart';
import 'package:flutter/material.dart'
    hide AppBar, BottomAppBar, FloatingActionButton, Title;
import 'package:takasburada/constants/constants.dart';
import 'package:takasburada/pages/create.dart';
import 'package:takasburada/pages/views/home/feed.dart';
import 'package:takasburada/pages/views/home/messages.dart';
import 'package:takasburada/pages/views/home/search.dart';
import 'package:provider/provider.dart' hide Create;
import 'package:takasburada/providers/bottom_navigation_bar_provider.dart';
import 'package:takasburada/widgets/app_bar.dart';
import 'package:takasburada/widgets/bottom_app_bar.dart';
import 'package:takasburada/widgets/floating_action_button.dart';
import 'package:takasburada/widgets/profile_button.dart';
import 'package:takasburada/widgets/title.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AppBar(
              children: [
                Hero(
                  tag: customTitleHeroTag,
                  child: Title(),
                ),
                Expanded(child: SizedBox()),
                ProfileButton(),
              ],
            ),
            Expanded(
                child: PageTransitionSwitcher(
              transitionBuilder: (
                Widget child,
                Animation<double> animation,
                Animation<double> secondaryAnimation,
              ) {
                return FadeThroughTransition(
                  animation: animation,
                  secondaryAnimation: secondaryAnimation,
                  child: child,
                  fillColor: Colors.transparent,
                );
              },
              child: bottomNavigationBarViews[context
                  .watch<BottomNavigationBarProvider>()
                  .bottomNavigationIndex],
            )),
            BottomAppBar(
              floatingActionButton: OpenContainer(
                transitionType: ContainerTransitionType.fadeThrough,
                openBuilder: (context, onTap) => Create(onTap: onTap),
                closedBuilder: (context, onTap) => FloatingActionButton(
                  icon: floatingActionButtonIcons[context
                      .watch<BottomNavigationBarProvider>()
                      .bottomNavigationIndex],
                  onTap: onTap,
                ),
                closedShape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(floatingActionButtonBorderRadius),
                ),
                closedElevation: floatingActionButtonElevation,
                closedColor: floatingActionButtonColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List<Widget> bottomNavigationBarViews = [
  Feed(),
  Search(),
  Messages(),
];

List<String> floatingActionButtonIcons = [
  "images/add.png",
  "images/check.png",
  "images/clear.png",
];
