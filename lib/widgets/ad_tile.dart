import 'package:flutter/material.dart';
import 'package:takasburada/classes/ad.dart';
import 'package:takasburada/constants/constants.dart';
import 'package:takasburada/pages/detail.dart';

class AdTile extends StatelessWidget {
  final Ad ad;
  final bool withActions;
  const AdTile({
    Key? key,
    required this.ad,
    this.withActions = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: withActions
          ? adTileHeight(context)
          : adTileHeightWithoutActions(context),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Material(
              elevation: elevation,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(adTileBorderRadius),
                bottomRight: Radius.circular(adTileBorderRadius),
              ),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(adTileBorderRadius),
                      bottomRight: Radius.circular(adTileBorderRadius),
                    ),
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Image.asset(ad.givenProductImage,
                                      fit: BoxFit.cover),
                                ),
                                Expanded(
                                  child: Image.asset(ad.desiredProductImage,
                                      fit: BoxFit.cover),
                                ),
                              ],
                            ),
                            Container(
                              height: withActions
                                  ? adTileImageHeight(context)
                                  : adTileImageHeightWithoutActions(context),
                              alignment: Alignment.center,
                              child: Material(
                                elevation: elevation,
                                color: Color(0xffF7EBB9),
                                borderRadius: BorderRadius.circular(
                                    adTileTradeIconBorderRadius),
                                child: Container(
                                  width: adTileTradeIconWidth,
                                  height: adTileTradeIconWidth,
                                  child: Image.asset("images/arrows.png"),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: containerPadding),
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: Text(
                                    ad.givenProductName +
                                        " - " +
                                        ad.desiredProductName,
                                    style: adProductNamesTextStyle,
                                  ),
                                ),
                                Text(
                                  "${DateTime.now().day - ad.postDate.day} ${(DateTime.now().day - ad.postDate.day) == 1 ? "day" : "days"} ago",
                                  style: adPostDateTextStyle,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned.fill(
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(adTileBorderRadius),
                          bottomRight: Radius.circular(adTileBorderRadius),
                        ),
                        onTap: withActions
                            ? () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Detail(ad: ad),
                                  ),
                                );
                              }
                            : () {},
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: containerPadding,
          ),
          withActions
              ? Material(
                  elevation: elevation,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(adTileBorderRadius),
                    bottomLeft: Radius.circular(adTileBorderRadius),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(adTileBorderRadius),
                      bottomLeft: Radius.circular(adTileBorderRadius),
                    ),
                    child: Material(
                      elevation: elevation,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(adTileBorderRadius),
                        bottomLeft: Radius.circular(adTileBorderRadius),
                      ),
                      child: Container(
                        width: adTileActionItemWidth,
                        child: Column(
                          children: customAdTileIcons
                              .map(
                                (customAdTileIcon) => InkWell(
                                  child: Container(
                                    height: adTileActionItemHeight(context),
                                    child: Image.asset(customAdTileIcon),
                                  ),
                                  onTap: () {},
                                ),
                              )
                              .toList(),
                        ),
                      ),
                    ),
                  ),
                )
              : SizedBox(),
        ],
      ),
    );
  }
}

List<String> customAdTileIcons = [
  "images/share.png",
  "images/favorite.png",
  "images/ask.png",
];
