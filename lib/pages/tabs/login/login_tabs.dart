import 'package:flutter/material.dart';
import 'package:takasburada/constants/constants.dart';
import 'package:takasburada/pages/tabs/login/sign_in.dart';
import 'package:takasburada/pages/tabs/login/sign_up.dart';

class LoginTabs extends StatelessWidget {
  const LoginTabs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Container(
        child: Column(
          children: [
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
                    "sign up",
                    style: tabTitleTextStyle,
                  ),
                ),
              ],
            ),
            TabBarView(
              children: [
                SignUp(),
                SignIn(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
