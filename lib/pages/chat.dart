import 'package:flutter/material.dart'
    hide AppBar, IconButton, BottomAppBar, FloatingActionButton, TextField;
import 'package:takasburada/classes/message.dart';
import 'package:takasburada/constants/constants.dart';
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
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            AppBar(
              withTitle: false,
              children: [
                IconButton(
                  icon: "images/back.png",
                  onTap: onTap,
                ),
                SizedBox(width: containerPadding),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(messages[index].sender,
                        style: messageTileSenderTextStyle),
                    Text("online", style: messageTileMessageTextStyle),
                  ],
                ),
                Expanded(child: SizedBox()),
                IconButton(
                  icon: "images/media.png",
                  withElevation: false,
                  onTap: () {},
                ),
                IconButton(
                  icon: "images/more.png",
                  withElevation: false,
                  onTap: () {},
                ),
              ],
            ),
            Expanded(
              child: ListView(
                physics: BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                children: [
                  ChatTile(text: messages[index].message),
                ],
              ),
            ),
            BottomAppBar(
              child: TextField(
                hint: "type here",
              ),
              floatingActionButton: FloatingActionButton(
                icon: "images/send.png",
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
