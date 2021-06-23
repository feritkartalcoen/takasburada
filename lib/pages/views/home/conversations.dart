import 'package:animations/animations.dart';
import 'package:flutter/material.dart' hide RefreshIndicator;
import 'package:takasburada/classes/ad.dart';
import 'package:takasburada/classes/conversation.dart';
import 'package:takasburada/classes/user.dart';
import 'package:takasburada/constants/constants.dart';
import 'package:takasburada/pages/chat.dart';
import 'package:takasburada/widgets/conversation_tile.dart';
import 'package:takasburada/widgets/refresh_indicator.dart';
/* import 'package:provider/provider.dart';
import 'package:takasburada/providers/providers.dart' as providers; */

class Conversations extends StatefulWidget {
  const Conversations({Key? key}) : super(key: key);

  @override
  _ConversationsState createState() => _ConversationsState();
}

class _ConversationsState extends State<Conversations> {
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
    return conversations != null && ads != null
        ? RefreshIndicator(
            onRefresh: getConversations,
            child: ListView.separated(
              padding: EdgeInsets.only(right: containerPadding),
              physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
              itemCount: conversations!.length,
              itemBuilder: (context, index) => OpenContainer(
                openBuilder: (context, onTap) => Chat(index: index, onTap: onTap),
                closedBuilder: (context, onTap) => ConversationTile(
                  userPhoto: users.where((user) => user.id == ads!.where((ad) => ad.id == conversations![index].adId).single.userId).single.photo,
                  userNameSurname: users.where((user) => user.id == ads!.where((ad) => ad.id == conversations![index].adId).single.userId).single.nameSurname,
                  message: conversations![index].lastMessage!.userId == currentUserId ? "you: " + conversations![index].lastMessage!.text! : conversations![index].lastMessage!.text,
                  productPhoto: ads!.where((ad) => ad.id == conversations![index].adId).single.products!.where((product) => product!.adId == conversations![index].adId).single!.photo,
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
            ),
          )
        : RefreshIndicator(
            onRefresh: getConversations,
            child: ListView(
              physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            ),
          );
  }
}
