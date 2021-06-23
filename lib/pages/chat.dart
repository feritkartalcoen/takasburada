import 'package:flutter/material.dart' hide AppBar, IconButton, BottomAppBar, FloatingActionButton, TextField;
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

class Chat extends StatefulWidget {
  final int index;
  final VoidCallback? onTap;
  const Chat({
    Key? key,
    required this.index,
    this.onTap,
  }) : super(key: key);

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  List<Conversation>? conversations;
  List<Ad>? ads;

  @override
  void initState() {
    super.initState();
    getConversations();
    getAds();
  }

  Future<void> getConversations() async {
    /* context.read<providers.FirebaseProvider>().getConversations().then(
      (value) {
        setState(() {
          conversations = value;
        });
      },
    ); */
  }

  Future<void> getAds() async {
    /* context.read<providers.FirebaseProvider>().getAds().then(
      (value) {
        setState(() {
          ads = value;
        });
      },
    ); */
  }

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
                onTap: widget.onTap,
              ),
              SizedBox(width: containerPadding),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(users.where((user) => user.id == ads!.where((ad) => ad.id == conversations![widget.index].adId).single.userId).single.nameSurname, style: listTileTitleTextStyle),
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
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.zero,
              physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
              itemCount: conversations![widget.index].messages!.length,
              itemBuilder: (context, messageIndex) => ChatTile(
                text: conversations![widget.index].messages![messageIndex]!.text!,
                isReceived: conversations![widget.index].messages![messageIndex]!.userId != currentUserId,
              ),
              separatorBuilder: (context, index) => SizedBox(height: containerPadding / 2),
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
