import 'package:animations/animations.dart';
import 'package:flutter/material.dart' hide TabBar, Title, AppBar;
import 'package:provider/provider.dart';
import 'package:takasburada/constants/constants.dart';
import 'package:takasburada/pages/views/login/sign_in.dart';
import 'package:takasburada/pages/views/login/sign_up.dart';
import 'package:takasburada/providers/providers.dart' as providers;
import 'package:takasburada/widgets/app_bar.dart';
import 'package:takasburada/widgets/tab_bar.dart';
import 'package:takasburada/widgets/title.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppBar(
            children: [
              Hero(
                tag: titleHeroTag,
                child: Title(),
              ),
            ],
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
              child: tabBarViews[context.watch<providers.TabBar>().tabIndex],
            ),
          ),
        ],
      ),
    );
  }
}

List<Widget> tabBarViews = [
  SignUp(),
  SignIn(),
];
