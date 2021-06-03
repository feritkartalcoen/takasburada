import 'package:flutter/material.dart';
import 'package:takasburada/pages/login.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => Login(),
      },
    );
  }
}
