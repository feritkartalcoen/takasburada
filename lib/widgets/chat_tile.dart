import 'package:flutter/material.dart';
import 'package:takasburada/constants/constants.dart';

class ChatTile extends StatelessWidget {
  final String text;
  const ChatTile({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Material(
          elevation: elevation,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(chatTileBorderRadius),
            bottomRight: Radius.circular(chatTileBorderRadius),
          ),
          child: Container(
            height: 36,
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: containerPadding),
            child: Text(
              text,
              style: chatTileTextStyle,
            ),
          ),
        ),
      ],
    );
  }
}
