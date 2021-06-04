import 'package:flutter/material.dart';
import 'package:takasburada/constants/constants.dart';
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
              indicatorColor: tabColor,
              labelStyle: tabTitleTextStyle,
              labelColor: tabTitleTextStyle.color,
              unselectedLabelStyle: tabTitleTextStyle,
              unselectedLabelColor: tabTitleTextStyle.color,
              indicatorPadding:
                  EdgeInsets.symmetric(horizontal: containerPadding),
              indicator: ShapeDecoration(
                color: tabColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(tabBorderRadius),
                ),
              ),
              tabs: tabs,
            ),
            Expanded(
              child: TabBarView(
                children: tabBarViews,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List<Widget> tabs = [
  Tab(
    child: Text("sign up"),
  ),
  Tab(
    child: Text("sign in"),
  ),
];

List<Widget> tabBarViews = [
  SignUp(),
  SignIn(),
];
