import 'package:flutter/material.dart' hide AppBar, IconButton, BottomAppBar, FloatingActionButton, TextField;
import 'package:takasburada/models/conversation.dart';
import 'package:takasburada/models/user.dart';
import 'package:takasburada/constants/constants.dart';
import 'package:takasburada/constants/custom_icons.dart';
import 'package:takasburada/widgets/app_bar.dart';
import 'package:takasburada/widgets/bottom_app_bar.dart';
import 'package:takasburada/widgets/message_tile.dart';
import 'package:takasburada/widgets/floating_action_button.dart';
import 'package:takasburada/widgets/icon_button.dart';
import 'package:takasburada/widgets/text_field.dart';
import 'package:provider/provider.dart';
import 'package:takasburada/providers/providers.dart' as providers;

class Chat extends StatelessWidget {
  final Conversation conversation;
  final String adId;
  final String userId;
  final VoidCallback? onTap;
  const Chat({
    Key? key,
    required this.conversation,
    required this.adId,
    required this.userId,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        withTitle: false,
        children: [
          IconButton(
            icon: CustomIcons.back,
            onTap: onTap ?? () => Navigator.pop(context),
          ),
          SizedBox(width: containerPadding),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FutureBuilder<User?>(
                future: context.read<providers.FirebaseProvider>().getUser(userId: userId),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    User user = snapshot.data!;
                    return Text(user.nameSurname, style: listTileTitleTextStyle);
                  }
                  return Text("", style: listTileTitleTextStyle);
                },
              ),
              Text("online", style: listTileSubtitleTextStyle),
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
      body: ListView.separated(
        padding: EdgeInsets.zero,
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        itemCount: conversation.messages!.length,
        itemBuilder: (context, messageIndex) => MessageTile(
          text: conversation.messages![messageIndex]!.text!,
          isReceived: conversation.messages![messageIndex]!.userId != context.read<providers.FirebaseProvider>().firebaseAuth.currentUser!.uid,
        ),
        separatorBuilder: (context, index) => SizedBox(height: containerPadding / 2),
      ),
      bottomNavigationBar: BottomAppBar(
        child: TextField(
          hint: "type here",
        ),
        floatingActionButton: FloatingActionButton(
          icon: CustomIcons.send,
          onTap: () {},
        ),
      ),
    );
  }
}
