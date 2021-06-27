import 'package:animations/animations.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;
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
        StreamProvider(
          create: (context) => FirebaseAuth.instance.userChanges(),
          initialData: null,
        ),
        ChangeNotifierProvider(create: (_) => providers.IndexProvider()),
        Provider(
          create: (_) => providers.ImageProvider(),
        ),
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
        home: FirebaseAuth.instance.currentUser == null ? Login() : Home(),
      ),
    );
  }
}
