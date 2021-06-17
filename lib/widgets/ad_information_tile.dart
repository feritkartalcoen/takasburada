import 'package:flutter/material.dart';
import 'package:takasburada/constants/constants.dart';

class AdInformationTile extends StatelessWidget {
  final String information;
  const AdInformationTile({
    Key? key,
    required this.information,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: containerPadding),
      child: Material(
        elevation: elevation,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(adInformationTileBorderRadius),
          bottomLeft: Radius.circular(adInformationTileBorderRadius),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: containerPadding, vertical: containerPadding / 2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("information", style: adInformationTileTitleTextStyle),
              SizedBox(height: containerPadding / 2),
              Text(information, textAlign: TextAlign.justify, style: adInformationTileTextStyle),
            ],
          ),
        ),
      ),
    );
  }
}
