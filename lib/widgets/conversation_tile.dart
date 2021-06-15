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
          topRight: Radius.circular(messageTileBorderRadius),
          bottomRight: Radius.circular(messageTileBorderRadius),
        ),
        child: InkWell(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(messageTileBorderRadius),
            bottomRight: Radius.circular(messageTileBorderRadius),
          ),
          child: ListTile(
            leading: Material(
              elevation: elevation,
              shape: CircleBorder(),
              child: CircleAvatar(
                foregroundImage: AssetImage(userPhoto!),
              ),
            ),
            title: Text(
              userNameSurname!,
              style: messageTileSenderTextStyle,
            ),
            subtitle: Text(
              message!,
              style: messageTileMessageTextStyle,
            ),
            trailing: Material(
              elevation: elevation,
              shape: CircleBorder(),
              child: CircleAvatar(
                foregroundImage: AssetImage(productPhoto!),
              ),
            ),
          ),
          onTap: onTap,
        ),
      ),
    );
  }
}
