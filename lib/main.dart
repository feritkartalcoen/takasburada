import 'package:animations/animations.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:takasburada/pages/home.dart';
import 'package:takasburada/pages/login.dart';
import 'package:takasburada/providers/providers.dart' as providers;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<providers.Authentication>(
          create: (_) => providers.Authentication(
            firebaseAuth: FirebaseAuth.instance,
            firebaseFirestore: FirebaseFirestore.instance,
          ),
        ),
        StreamProvider(
          create: (context) => context.read<providers.Authentication>().userChanges,
          initialData: null,
        ),
        ChangeNotifierProvider(create: (_) => providers.TabBar()),
        ChangeNotifierProvider(create: (_) => providers.BottomNavigationBar()),
      ],
      builder: (context, _) => MaterialApp(
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
        home: context.watch<providers.Authentication>().user == null ? Login() : Home(),
      ),
    );
  }
}
