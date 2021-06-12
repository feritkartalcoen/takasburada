import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:takasburada/classes/message.dart';
import 'package:takasburada/constants/constants.dart';
import 'package:takasburada/pages/chat.dart';
import 'package:takasburada/widgets/message_tile.dart';

class Messages extends StatelessWidget {
  const Messages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.only(right: containerPadding),
      physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      itemCount: messages.length,
      itemBuilder: (context, index) => OpenContainer(
        openBuilder: (context, onTap) => Chat(index: index, onTap: onTap),
        closedBuilder: (context, onTap) => MessageTile(
          image: messages[index].image,
          sender: messages[index].sender,
          message: messages[index].message,
          onTap: onTap,
        ),
        closedElevation: messageTileElevation,
        closedShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(messageTileBorderRadius),
            bottomRight: Radius.circular(messageTileBorderRadius),
          ),
        ),
      ),
      separatorBuilder: (context, index) {
        return SizedBox(
          height: containerPadding,
        );
      },
    );
  }
}
