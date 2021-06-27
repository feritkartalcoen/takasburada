import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:takasburada/constants/constants.dart';
import 'package:takasburada/models/message.dart';
import 'package:takasburada/models/user.dart';

class ConversationTile extends StatelessWidget {
  final String? userPhoto;
  final String? userNameSurname;
  final Message? message;
  final String? productPhoto;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  const ConversationTile({
    Key? key,
    this.userPhoto,
    this.userNameSurname,
    this.message,
    this.productPhoto,
    this.onTap,
    this.onLongPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Material(
        elevation: elevation,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(borderRadius),
          bottomRight: Radius.circular(borderRadius),
        ),
        child: InkWell(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(borderRadius),
            bottomRight: Radius.circular(borderRadius),
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
            subtitle: Text(
              message!.userId == User.currentUserId ? "you: ${message!.text}" : message!.text,
              style: message!.userId == User.currentUserId ? listTileSentSubtitleTextStyle : listTileReceivedSubtitleTextStyle,
              overflow: TextOverflow.ellipsis,
            ),
            trailing: Material(
              elevation: elevation,
              shape: CircleBorder(),
              child: CircleAvatar(
                foregroundImage: CachedNetworkImageProvider(productPhoto!),
              ),
            ),
          ),
          onTap: onTap,
          onLongPress: onLongPress,
        ),
      ),
    );
  }
}
