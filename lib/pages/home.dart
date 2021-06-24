import 'package:animations/animations.dart';
import 'package:flutter/material.dart' hide AppBar, BottomAppBar, FloatingActionButton, Title, BottomNavigationBar, SnackBar;
import 'package:takasburada/constants/constants.dart';
import 'package:takasburada/constants/custom_icons.dart';
import 'package:takasburada/pages/create.dart';
import 'package:takasburada/pages/login.dart';
import 'package:takasburada/pages/result.dart';
import 'package:takasburada/pages/views/home/feed.dart';
import 'package:takasburada/pages/views/home/conversations.dart';
import 'package:takasburada/pages/views/home/search.dart';
import 'package:provider/provider.dart' hide Create;
import 'package:takasburada/providers/providers.dart' as providers;
import 'package:takasburada/widgets/app_bar.dart';
import 'package:takasburada/widgets/bottom_app_bar.dart';
import 'package:takasburada/widgets/bottom_navigation_bar.dart';
import 'package:takasburada/widgets/floating_action_button.dart';
import 'package:takasburada/widgets/profile_button.dart';
import 'package:takasburada/widgets/snack_bar.dart';
import 'package:takasburada/widgets/title.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        children: [
          Hero(
            tag: titleHeroTag,
            child: Title(),
          ),
          Expanded(child: SizedBox()),
          ProfileButton(
            onTap: () {
              context.read<providers.FirebaseProvider>().signOut().then((result) {
                print("signed out");
                SnackBar.show(context, "signed out");
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Login(),
                  ),
                );
              });
            },
          ),
        ],
      ),
      body: PageTransitionSwitcher(
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
        child: bottomNavigationBarViews[context.watch<providers.IndexProvider>().bottomNavigationIndex],
      ),
      bottomNavigationBar: BottomAppBar(
        child: BottomNavigationBar(
          icons: [
            CustomIcons.home,
            CustomIcons.search,
            CustomIcons.chat
          ],
        ),
        floatingActionButton: Provider.of<providers.IndexProvider>(context).bottomNavigationIndex != 2
            ? OpenContainer(
                openBuilder: (context, onTap) {
                  return Provider.of<providers.IndexProvider>(context).bottomNavigationIndex == 0 ? Create(onTap: onTap) : Result(onTap: onTap);
                },
                closedBuilder: (context, onTap) => FloatingActionButton(
                  color: Colors.transparent,
                  fabElevation: 0,
                  icon: floatingActionButtonIcons[context.watch<providers.IndexProvider>().bottomNavigationIndex],
                  onTap: onTap,
                ),
                closedShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(floatingActionButtonBorderRadius),
                ),
                closedElevation: elevation,
                closedColor: floatingActionButtonColor,
              )
            : FloatingActionButton(
                icon: floatingActionButtonIcons[context.watch<providers.IndexProvider>().bottomNavigationIndex],
                onTap: () {},
              ),
      ),
    );
  }
}

List<Widget> bottomNavigationBarViews = [
  Feed(),
  Search(),
  Conversations(),
];

List<IconData> floatingActionButtonIcons = [
  CustomIcons.add,
  CustomIcons.check,
  CustomIcons.trash,
];
