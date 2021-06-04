import 'package:flutter/material.dart';
import 'package:takasburada/constants/constants.dart';
import 'package:takasburada/pages/tabs/login/login_tabs.dart';
import 'package:takasburada/pages/tabs/login/sign_in.dart';
import 'package:takasburada/pages/tabs/login/sign_up.dart';
import 'package:takasburada/widgets/app_title.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Column(
          children: [
            AppTitle(),
            TabBar(
              tabs: [
                Tab(
                  child: Text(
                    "sign up",
                    style: tabTitleTextStyle,
                  ),
                ),
                Tab(
                  child: Text(
                    "sign in",
                    style: tabTitleTextStyle,
                  ),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  SignUp(),
                  SignIn(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
