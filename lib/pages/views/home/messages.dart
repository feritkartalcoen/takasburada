import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:takasburada/classes/conversation.dart';
import 'package:takasburada/classes/user.dart';
import 'package:takasburada/constants/constants.dart';
import 'package:takasburada/pages/chat.dart';
import 'package:takasburada/widgets/conversation_tile.dart';

class Messages extends StatelessWidget {
  const Messages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.only(right: containerPadding),
      physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      itemCount: conversations.length,
      itemBuilder: (context, index) => OpenContainer(
        openBuilder: (context, onTap) => Chat(index: index, onTap: onTap),
        closedBuilder: (context, onTap) => ConversationTile(
          image: users
              .where((user) => user.id == conversations[index].userId)
              .single
              .photo,
          sender: users
              .where((user) => user.id == conversations[index].userId)
              .single
              .nameSurname,
          message: conversations[index].messages?.last?.text,
          onTap: onTap,
        ),
        closedElevation: elevation,
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
