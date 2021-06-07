import 'package:flutter/material.dart';
import 'package:takasburada/constants/constants.dart';
import 'package:takasburada/widgets/custom_app_bar.dart';
import 'package:takasburada/widgets/custom_bottom_app_bar.dart';
import 'package:takasburada/widgets/custom_floating_action_button.dart';
import 'package:takasburada/widgets/custom_profile_button.dart';
import 'package:takasburada/widgets/custom_title.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomAppBar(
              children: [
                Hero(
                  tag: customTitleHeroTag,
                  child: CustomTitle(),
                ),
                Expanded(child: SizedBox()),
                CustomProfileButton(),
              ],
            ),
            Expanded(child: SizedBox()),
            CustomBottomAppBar(
              floatingActionButton: CustomFloatingActionButton(
                image: "images/add.png",
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
