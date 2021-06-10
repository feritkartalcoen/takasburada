import 'package:flutter/material.dart';
import 'package:takasburada/constants/constants.dart';

class CustomMessageTile extends StatelessWidget {
  final String image;
  final String sender;
  final String message;
  final VoidCallback onTap;
  const CustomMessageTile({
    Key? key,
    required this.image,
    required this.sender,
    required this.message,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Material(
        elevation: messageTileElevation,
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
              foregroundImage: AssetImage(image),
            ),
            title: Text(
              sender,
              style: messageTileSenderTextStyle,
            ),
            subtitle: Text(
              message,
              style: messageTileMessageTextStyle,
            ),
          ),
          onTap: onTap,
        ),
      ),
    );
  }
}
