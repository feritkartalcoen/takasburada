import 'package:flutter/material.dart' hide AppBar, IconButton;
import 'package:takasburada/classes/ad.dart';
import 'package:takasburada/constants/constants.dart';
import 'package:takasburada/widgets/ad_information_tile.dart';
import 'package:takasburada/widgets/ad_tile.dart';
import 'package:takasburada/widgets/app_bar.dart';
import 'package:takasburada/widgets/icon_button.dart';

class Detail extends StatelessWidget {
  const Detail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ad = ModalRoute.of(context)!.settings.arguments as Ad;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppBar(
            withTitle: false,
            children: [
              IconButton(
                icon: "images/back.png",
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              Expanded(child: SizedBox()),
              ...customAdTileIcons.map(
                (customAdTileIcon) => IconButton(
                  withElevation: false,
                  icon: customAdTileIcon,
                  onTap: () {},
                ),
              ),
              IconButton(
                withElevation: false,
                icon: "images/more.png",
                onTap: () {},
              )
            ],
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              physics: BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              children: [
                AdTile(ad: ad, withActions: false),
                SizedBox(height: containerPadding),
                AdInformationTile(information: loremIpsumParagraph),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
