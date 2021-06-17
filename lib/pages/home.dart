import 'package:animations/animations.dart';
import 'package:flutter/material.dart' hide AppBar, BottomAppBar, FloatingActionButton, Title, BottomNavigationBar;
import 'package:takasburada/constants/constants.dart';
import 'package:takasburada/constants/custom_icons.dart';
import 'package:takasburada/pages/create.dart';
import 'package:takasburada/pages/login.dart';
import 'package:takasburada/pages/result.dart';
import 'package:takasburada/pages/views/home/feed.dart';
import 'package:takasburada/pages/views/home/messages.dart';
import 'package:takasburada/pages/views/home/search.dart';
import 'package:provider/provider.dart' hide Create;
import 'package:takasburada/providers/bottom_navigation_bar_provider.dart';
import 'package:takasburada/services/authentication.dart';
import 'package:takasburada/widgets/app_bar.dart';
import 'package:takasburada/widgets/bottom_app_bar.dart';
import 'package:takasburada/widgets/bottom_navigation_bar.dart';
import 'package:takasburada/widgets/floating_action_button.dart';
import 'package:takasburada/widgets/profile_button.dart';
import 'package:takasburada/widgets/title.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Authentication authentication = Authentication();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AppBar(
            children: [
              Hero(
                tag: titleHeroTag,
                child: Title(),
              ),
              Expanded(child: SizedBox()),
              ProfileButton(
                onTap: () {
                  authentication.signOut().then(
                        (value) => Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Login(),
                          ),
                        ),
                      );
                },
              ),
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
            child: bottomNavigationBarViews[context.watch<BottomNavigationBarProvider>().bottomNavigationIndex],
          )),
          BottomAppBar(
            child: BottomNavigationBar(
              icons: [
                CustomIcons.home,
                CustomIcons.search,
                CustomIcons.chat
              ],
            ),
            floatingActionButton: Provider.of<BottomNavigationBarProvider>(context).bottomNavigationIndex != 2
                ? OpenContainer(
                    openBuilder: (context, onTap) {
                      return Provider.of<BottomNavigationBarProvider>(context).bottomNavigationIndex == 0 ? Create(onTap: onTap) : Result(onTap: onTap);
                    },
                    closedBuilder: (context, onTap) => FloatingActionButton(
                      icon: floatingActionButtonIcons[context.watch<BottomNavigationBarProvider>().bottomNavigationIndex],
                      onTap: onTap,
                    ),
                    closedShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(floatingActionButtonBorderRadius),
                    ),
                    closedElevation: elevation,
                    closedColor: floatingActionButtonColor,
                  )
                : FloatingActionButton(
                    icon: floatingActionButtonIcons[context.watch<BottomNavigationBarProvider>().bottomNavigationIndex],
                    onTap: () {},
                  ),
          ),
        ],
      ),
    );
  }
}

List<Widget> bottomNavigationBarViews = [
  Feed(),
  Search(),
  Messages(),
];

List<IconData> floatingActionButtonIcons = [
  CustomIcons.add,
  CustomIcons.check,
  CustomIcons.trash,
];
