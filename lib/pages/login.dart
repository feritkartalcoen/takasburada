import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:takasburada/constants/constants.dart';
import 'package:takasburada/providers/tab_bar_provider.dart';
import 'package:takasburada/widgets/custom_tab_bar.dart';
import 'package:takasburada/widgets/custom_tab_bar_views.dart';
import 'package:takasburada/widgets/custom_title.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => TabBarProvider()),
      ],
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
              CustomTabBar(),
              SizedBox(
                height: containerPadding,
              ),
              Expanded(
                child: CustomTabBarViews(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
