import 'package:flutter/material.dart';
import 'package:takasburada/constants/constants.dart';

class ProfileTile extends StatelessWidget {
  final String? userPhoto;
  final String? userNameSurname;
  final VoidCallback? onTap;
  const ProfileTile({
    Key? key,
    this.userPhoto,
    this.userNameSurname,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: containerPadding),
      child: Material(
        elevation: elevation,
        borderRadius: BorderRadius.circular(adTileBorderRadius),
        child: InkWell(
          borderRadius: BorderRadius.circular(adTileBorderRadius),
          child: ListTile(
            leading: Material(
              elevation: elevation,
              shape: CircleBorder(),
              child: CircleAvatar(
                foregroundImage: AssetImage(userPhoto!),
              ),
            ),
            title: Text(userNameSurname!, style: listTileTitleTextStyle),
            subtitle: Text("tap here to view profile", style: listTileSubtitleTextStyle),
          ),
          onTap: onTap,
        ),
      ),
    );
  }
}
