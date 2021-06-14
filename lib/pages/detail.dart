import 'package:flutter/material.dart' hide AppBar, IconButton;
import 'package:takasburada/classes/ad.dart';
import 'package:takasburada/constants/constants.dart';
import 'package:takasburada/constants/custom_icons.dart';
import 'package:takasburada/widgets/ad_information_tile.dart';
import 'package:takasburada/widgets/ad_tile.dart';
import 'package:takasburada/widgets/app_bar.dart';
import 'package:takasburada/widgets/icon_button.dart';

class Detail extends StatelessWidget {
  final Ad ad;
  const Detail({
    Key? key,
    required this.ad,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppBar(
            withTitle: false,
            children: [
              IconButton(
                icon: CustomIcons.back,
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              Expanded(child: SizedBox()),
              ...adTileIcons.map(
                (icon) => IconButton(
                  withElevation: false,
                  icon: icon,
                  onTap: () {},
                ),
              ),
              IconButton(
                withElevation: false,
                icon: CustomIcons.more,
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
