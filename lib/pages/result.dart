import 'package:flutter/material.dart' hide AppBar, IconButton, TextButton;
import 'package:takasburada/classes/ad.dart';
import 'package:takasburada/constants/constants.dart';
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
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            AppBar(
              withTitle: false,
              children: [
                IconButton(
                  icon: "images/back.png",
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
                itemCount: ads.length,
                itemBuilder: (context, index) {
                  return AdTile(
                    givenProductName: ads[index].givenProductName,
                    givenProductImage: ads[index].givenProductImage,
                    desiredProductName: ads[index].desiredProductName,
                    desiredProductImage: ads[index].desiredProductImage,
                    postDate: ads[index].postDate,
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
      ),
    );
  }
}
