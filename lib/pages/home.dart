import 'package:animations/animations.dart';
import 'package:flutter/material.dart'
    hide
        AppBar,
        BottomAppBar,
        FloatingActionButton,
        Title,
        BottomNavigationBar,
        SnackBar;
import 'package:takasburada/constants/constants.dart';
import 'package:takasburada/constants/custom_icons.dart';
import 'package:takasburada/pages/create.dart';
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
          const ProfileButton(),
        ],
      ),
      body: Column(
        children: [
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
                  .watch<providers.IndexProvider>()
                  .bottomNavigationIndex],
            ),
          ),
          BottomAppBar(
            child: BottomNavigationBar(
              icons: [CustomIcons.home, CustomIcons.search, CustomIcons.chat],
            ),
            floatingActionButton: FloatingActionButton(
              icon: floatingActionButtonIcons[context
                  .watch<providers.IndexProvider>()
                  .bottomNavigationIndex],
              onTap: () {
                var index =
                    Provider.of<providers.IndexProvider>(context, listen: false)
                        .bottomNavigationIndex;
                if (index == 0) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Create(),
                    ),
                  );
                } else if (index == 1) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Result(),
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
      resizeToAvoidBottomInset: true,
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
