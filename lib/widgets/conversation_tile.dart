import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:takasburada/constants/constants.dart';

class ConversationTile extends StatelessWidget {
  final String? userPhoto;
  final String? userNameSurname;
  final String? message;
  final String? productPhoto;
  final VoidCallback? onTap;
  const ConversationTile({
    Key? key,
    this.userPhoto,
    this.userNameSurname,
    this.message,
    this.productPhoto,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(conversationTileBorderRadius),
          bottomRight: Radius.circular(conversationTileBorderRadius),
        ),
        child: InkWell(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(conversationTileBorderRadius),
            bottomRight: Radius.circular(conversationTileBorderRadius),
          ),
          child: ListTile(
            leading: Material(
              elevation: elevation,
              shape: CircleBorder(),
              child: CircleAvatar(
                foregroundImage: CachedNetworkImageProvider(userPhoto!),
              ),
            ),
            title: Text(userNameSurname!, style: listTileTitleTextStyle),
            subtitle: Text(message!, style: listTileSubtitleTextStyle),
            trailing: Material(
              elevation: elevation,
              shape: CircleBorder(),
              child: CircleAvatar(
                foregroundImage: CachedNetworkImageProvider(productPhoto!),
              ),
            ),
          ),
          onTap: onTap,
        ),
      ),
    );
  }
}
