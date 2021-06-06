import 'package:flutter/material.dart';
import 'package:takasburada/constants/constants.dart';
import 'package:takasburada/pages/tabs/login/sign_in.dart';
import 'package:takasburada/pages/tabs/login/sign_up.dart';
import 'package:takasburada/widgets/custom_title.dart';

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
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: containerPadding),
                child: Hero(
                  tag: customTitleHeroTag,
                  child: CustomTitle(),
                ),
              ),
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
