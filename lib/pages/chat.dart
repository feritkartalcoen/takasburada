import 'package:flutter/material.dart'
    hide AppBar, IconButton, BottomAppBar, FloatingActionButton, TextField;
import 'package:takasburada/classes/ad.dart';
import 'package:takasburada/classes/conversation.dart';
import 'package:takasburada/classes/user.dart';
import 'package:takasburada/constants/constants.dart';
import 'package:takasburada/constants/custom_icons.dart';
import 'package:takasburada/widgets/app_bar.dart';
import 'package:takasburada/widgets/bottom_app_bar.dart';
import 'package:takasburada/widgets/chat_tile.dart';
import 'package:takasburada/widgets/floating_action_button.dart';
import 'package:takasburada/widgets/icon_button.dart';
import 'package:takasburada/widgets/text_field.dart';

class Chat extends StatelessWidget {
  final int index;
  final VoidCallback? onTap;
  const Chat({
    Key? key,
    required this.index,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppBar(
            withTitle: false,
            children: [
              IconButton(
                icon: CustomIcons.back,
                onTap: onTap,
              ),
              SizedBox(width: containerPadding),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      users
                          .where(
                            (user) =>
                                user.id ==
                                ads
                                    .where(
                                      (ad) =>
                                          ad.id == conversations[index].adId,
                                    )
                                    .single
                                    .userId,
                          )
                          .single
                          .nameSurname,
                      style: messageTileSenderTextStyle),
                  Text("online", style: messageTileMessageTextStyle),
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
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              physics: BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics()),
              children: [
                ChatTile(text: conversations[index].messages!.last!.text!),
              ],
            ),
          ),
          BottomAppBar(
            child: TextField(
              hint: "type here",
            ),
            floatingActionButton: FloatingActionButton(
              icon: CustomIcons.send,
              onTap: () {},
            ),
          ),
        ],
      ),
    );
  }
}
