import 'package:animations/animations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:takasburada/pages/login.dart';
import 'package:takasburada/providers/bottom_navigation_bar_provider.dart';
import 'package:takasburada/providers/tab_bar_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(App());
}

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TabBarProvider()),
        ChangeNotifierProvider(create: (_) => BottomNavigationBarProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light().copyWith(
          pageTransitionsTheme: PageTransitionsTheme(
            builders: {
              TargetPlatform.android: FadeThroughPageTransitionsBuilder(),
              TargetPlatform.fuchsia: FadeThroughPageTransitionsBuilder(),
              TargetPlatform.iOS: FadeThroughPageTransitionsBuilder(),
              TargetPlatform.linux: FadeThroughPageTransitionsBuilder(),
              TargetPlatform.macOS: FadeThroughPageTransitionsBuilder(),
              TargetPlatform.windows: FadeThroughPageTransitionsBuilder(),
            },
          ),
        ),
        home: Login(),
      ),
    );
  }
}
