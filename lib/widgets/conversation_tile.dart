import 'package:flutter/material.dart';
import 'package:takasburada/constants/constants.dart';

class ConversationTile extends StatelessWidget {
  final String? image;
  final String? sender;
  final String? message;
  final VoidCallback? onTap;
  const ConversationTile({
    Key? key,
    this.image,
    this.sender,
    this.message,
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
            leading: CircleAvatar(
              foregroundImage: AssetImage(image!),
            ),
            title: Text(
              sender!,
              style: messageTileSenderTextStyle,
            ),
            subtitle: Text(
              message!,
              style: messageTileMessageTextStyle,
            ),
          ),
          onTap: onTap,
        ),
      ),
    );
  }
}
