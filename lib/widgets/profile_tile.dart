import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fadein/flutter_fadein.dart';
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
    return FadeIn(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: containerPadding),
        child: Material(
          elevation: elevation,
          borderRadius: BorderRadius.circular(borderRadius),
          child: InkWell(
            borderRadius: BorderRadius.circular(borderRadius),
            child: ListTile(
              leading: Material(
                elevation: elevation,
                shape: CircleBorder(),
                child: ClipOval(
                  child: userPhoto != null
                      ? CachedNetworkImage(
                          width: 40,
                          height: 40,
                          imageUrl: userPhoto!,
                          fit: BoxFit.fill,
                        )
                      : SizedBox(),
                ),
              ),
              title: Text(userNameSurname != null ? userNameSurname! : "", style: listTileTitleTextStyle),
              subtitle: Text("tap here to view profile", style: listTileReceivedSubtitleTextStyle),
            ),
            onTap: onTap,
          ),
        ),
      ),
    );
  }
}
