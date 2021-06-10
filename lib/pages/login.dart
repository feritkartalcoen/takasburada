import 'package:animations/animations.dart';
import 'package:flutter/material.dart' hide TabBar, Title;
import 'package:provider/provider.dart';
import 'package:takasburada/constants/constants.dart';
import 'package:takasburada/pages/views/login/sign_in.dart';
import 'package:takasburada/pages/views/login/sign_up.dart';
import 'package:takasburada/providers/tab_bar_provider.dart';
import 'package:takasburada/widgets/tab_bar.dart';
import 'package:takasburada/widgets/title.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: containerPadding),
              child: Hero(
                tag: customTitleHeroTag,
                child: Title(),
              ),
            ),
            TabBar(),
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
                child: tabBarViews[context.watch<TabBarProvider>().tabIndex],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List<Widget> tabBarViews = [
  SignUp(),
  SignIn(),
];
