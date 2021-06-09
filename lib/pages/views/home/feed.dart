import 'package:flutter/material.dart';
import 'package:takasburada/classes/ad.dart';
import 'package:takasburada/constants/constants.dart';
import 'package:takasburada/widgets/custom_ad_tile.dart';

class Feed extends StatelessWidget {
  const Feed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ListView.separated(
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        itemCount: ads.length,
        itemBuilder: (context, index) {
          return CustomAdTile(
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
    );
  }
}
