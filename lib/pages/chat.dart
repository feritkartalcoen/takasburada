import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart' hide AppBar, IconButton, BottomAppBar, FloatingActionButton, TextField;
import 'package:takasburada/models/message.dart';
import 'package:takasburada/models/user.dart';
import 'package:takasburada/constants/constants.dart';
import 'package:takasburada/constants/custom_icons.dart';
import 'package:takasburada/widgets/app_bar.dart';
import 'package:takasburada/widgets/bottom_app_bar.dart';
import 'package:takasburada/widgets/message_tile.dart';
import 'package:takasburada/widgets/floating_action_button.dart';
import 'package:takasburada/widgets/icon_button.dart';
import 'package:takasburada/widgets/text_field.dart';

class Chat extends StatelessWidget {
  final String conversationId;
  final User user;
  Chat({
    Key? key,
    required this.conversationId,
    required this.user,
  }) : super(key: key);

  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        withTitle: false,
        children: [
          IconButton(
            icon: CustomIcons.back,
            onTap: () => Navigator.pop(context),
          ),
          SizedBox(width: containerPadding),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(user.nameSurname, style: listTileTitleTextStyle),
              Text("online", style: listTileSentSubtitleTextStyle),
            ],
          ),
          Expanded(child: SizedBox()),
          IconButton(
            icon: CustomIcons.media,
            withElevation: false,
            onTap: () {},
          ),
          IconButton(
            icon: CustomIcons.more,
            withElevation: false,
            onTap: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot<Message>>(
              stream: Message.getMessages(conversationId: conversationId),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return SizedBox();
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return SizedBox();
                }
                List<Message> messages = snapshot.data!.docs.map(
                  (document) {
                    return Message(
                      id: document.data().id,
                      userId: document.data().userId,
                      text: document.data().text,
                      date: document.data().date,
                    );
                  },
                ).toList();
                return ListView.separated(
                  padding: EdgeInsets.zero,
                  physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    Message message = messages[index];
                    return MessageTile(
                      text: message.text,
                      isReceived: message.userId != User.currentUserId,
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(height: containerPadding / 2),
                );
              },
            ),
          ),
          BottomAppBar(
            child: TextField(
              textEditingController: textEditingController,
              textInputType: TextInputType.text,
              hint: "type here",
            ),
            floatingActionButton: FloatingActionButton(
              icon: CustomIcons.send,
              onTap: () {
                Message.createMessage(conversationId: conversationId, text: textEditingController.text).then(
                  (result) {
                    if (result == "message created") {
                      textEditingController.clear();
                    }
                  },
                );
              },
            ),
          ),
        ],
      ),
      resizeToAvoidBottomInset: true,
    );
  }
}
