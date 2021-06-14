import 'package:flutter/material.dart' hide AppBar, IconButton, TextButton;
import 'package:takasburada/classes/ad.dart';
import 'package:takasburada/constants/constants.dart';
import 'package:takasburada/constants/custom_icons.dart';
import 'package:takasburada/widgets/ad_tile.dart';
import 'package:takasburada/widgets/app_bar.dart';
import 'package:takasburada/widgets/icon_button.dart';
import 'package:takasburada/widgets/text_button.dart';

class Result extends StatelessWidget {
  final VoidCallback? onTap;
  const Result({
    Key? key,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppBar(
            withTitle: false,
            children: [
              IconButton(
                icon: CustomIcons.back,
                onTap: onTap,
              ),
              Expanded(child: SizedBox()),
              TextButton(text: "filter", onTap: () {}),
              TextButton(text: "sort", onTap: () {}),
            ],
          ),
          Expanded(
            child: ListView.separated(
              physics: BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              padding: EdgeInsets.zero,
              itemCount: ads.length,
              itemBuilder: (context, index) {
                return AdTile(
                  ad: ads[index],
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: containerPadding,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
