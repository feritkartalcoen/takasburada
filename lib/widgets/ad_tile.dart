import 'package:flutter/material.dart';
import 'package:takasburada/constants/constants.dart';

class AdTile extends StatelessWidget {
  final String givenProductName;
  final String givenProductImage;
  final String desiredProductName;
  final String desiredProductImage;
  final DateTime postDate;
  const AdTile({
    Key? key,
    required this.givenProductName,
    required this.givenProductImage,
    required this.desiredProductName,
    required this.desiredProductImage,
    required this.postDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: adTileHeight(context),
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
                                  child: Image.asset(givenProductImage,
                                      fit: BoxFit.cover),
                                ),
                                Expanded(
                                  child: Image.asset(desiredProductImage,
                                      fit: BoxFit.cover),
                                ),
                              ],
                            ),
                            Container(
                              height: adTileImageHeight(context),
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
                                horizontal: containerPadding / 2),
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: Text(
                                    givenProductName +
                                        " - " +
                                        desiredProductName,
                                    style: adProductNamesTextStyle,
                                  ),
                                ),
                                Text(
                                  "${DateTime.now().day - postDate.day} ${(DateTime.now().day - postDate.day) == 1 ? "day" : "days"} ago",
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
                        onTap: () {},
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
          Material(
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
          ),
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
