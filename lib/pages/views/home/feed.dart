import 'package:flutter/material.dart';
import 'package:takasburada/classes/ad.dart';
import 'package:takasburada/constants/constants.dart';
import 'package:takasburada/widgets/ad_tile.dart';

class Feed extends StatelessWidget {
  const Feed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
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
    );
  }
}
