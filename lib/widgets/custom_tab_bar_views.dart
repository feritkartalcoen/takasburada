import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:takasburada/pages/tabs/login/sign_in.dart';
import 'package:takasburada/pages/tabs/login/sign_up.dart';
import 'package:takasburada/providers/tab_bar_provider.dart';

class CustomTabBarViews extends StatelessWidget {
  const CustomTabBarViews({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageTransitionSwitcher(
      transitionBuilder: (
        Widget child,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
      ) {
        return FadeThroughTransition(
          animation: animation,
          secondaryAnimation: secondaryAnimation,
          child: child,
        );
      },
      child: tabBarViews[context.watch<TabBarProvider>().tabIndex],
    );
  }
}

List<Widget> tabBarViews = [
  SignUp(),
  SignIn(),
];
