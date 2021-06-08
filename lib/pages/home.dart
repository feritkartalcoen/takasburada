import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:takasburada/constants/constants.dart';
import 'package:takasburada/pages/views/home/feed.dart';
import 'package:takasburada/pages/views/home/messages.dart';
import 'package:takasburada/pages/views/home/search.dart';
import 'package:provider/provider.dart';
import 'package:takasburada/providers/bottom_navigation_bar_provider.dart';
import 'package:takasburada/widgets/custom_app_bar.dart';
import 'package:takasburada/widgets/custom_bottom_app_bar.dart';
import 'package:takasburada/widgets/custom_floating_action_button.dart';
import 'package:takasburada/widgets/custom_profile_button.dart';
import 'package:takasburada/widgets/custom_title.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomAppBar(
              children: [
                Hero(
                  tag: customTitleHeroTag,
                  child: CustomTitle(),
                ),
                Expanded(child: SizedBox()),
                CustomProfileButton(),
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
            CustomBottomAppBar(
              floatingActionButton: CustomFloatingActionButton(
                icon: floatingActionButtonIcons[context
                    .watch<BottomNavigationBarProvider>()
                    .bottomNavigationIndex],
                onTap: () {},
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
