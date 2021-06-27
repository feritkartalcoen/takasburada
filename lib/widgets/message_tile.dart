import 'package:flutter/material.dart';
import 'package:flutter_fadein/flutter_fadein.dart';
import 'package:takasburada/constants/constants.dart';

class MessageTile extends StatelessWidget {
  final String text;
  final bool isReceived;
  const MessageTile({
    Key? key,
    required this.text,
    required this.isReceived,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: isReceived ? MainAxisAlignment.start : MainAxisAlignment.end,
        children: [
          Material(
            elevation: elevation,
            borderRadius: BorderRadius.only(
              topLeft: isReceived ? Radius.zero : Radius.circular(smallBorderRadius),
              topRight: isReceived ? Radius.circular(smallBorderRadius) : Radius.zero,
              bottomRight: isReceived ? Radius.circular(smallBorderRadius) : Radius.zero,
              bottomLeft: isReceived ? Radius.zero : Radius.circular(smallBorderRadius),
            ),
            child: Container(
              height: 36,
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: containerPadding),
              child: Text(text, style: isReceived ? chatTileReceivedTextStyle : chatTileSentTextStyle),
            ),
          ),
        ],
      ),
    );
  }
}
