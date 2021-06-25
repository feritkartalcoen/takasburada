import 'package:animations/animations.dart';
import 'package:flutter/material.dart' hide RefreshIndicator;
import 'package:takasburada/models/ad.dart';
import 'package:takasburada/models/conversation.dart';
import 'package:takasburada/models/user.dart';
import 'package:takasburada/constants/constants.dart';
import 'package:takasburada/pages/chat.dart';
import 'package:takasburada/widgets/conversation_tile.dart';
import 'package:takasburada/widgets/refresh_indicator.dart';
import 'package:provider/provider.dart';
import 'package:takasburada/providers/providers.dart' as providers;

class Conversations extends StatelessWidget {
  const Conversations({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String currentUserId = context.read<providers.FirebaseProvider>().firebaseAuth.currentUser!.uid;
    return RefreshIndicator(
      onRefresh: () async {
        await Future.wait([
          context.read<providers.FirebaseProvider>().getConversations(),
          context.read<providers.FirebaseProvider>().getAds(),
          context.read<providers.FirebaseProvider>().getUsers(),
        ]);
      },
      child: FutureBuilder<dynamic>(
        future: Future.wait([
          context.read<providers.FirebaseProvider>().getConversations(),
          context.read<providers.FirebaseProvider>().getAds(),
          context.read<providers.FirebaseProvider>().getUsers(),
        ]),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            List<Conversation> conversations = snapshot.data[0];
            List<Ad> ads = snapshot.data[1];
            List<User> users = snapshot.data[2];
            return ListView.separated(
              padding: EdgeInsets.only(right: containerPadding),
              physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
              itemCount: conversations.length,
              itemBuilder: (context, index) {
                return OpenContainer(
                  openBuilder: (context, onTap) {
                    return Chat(
                      conversation: conversations[index],
                      adId: conversations[index].adId!,
                      userId: conversations[index].id!.split("-").where((conversationId) => conversationId != currentUserId && conversationId != conversations[index].adId).single,
                      onTap: onTap,
                    );
                  },
                  closedBuilder: (context, onTap) {
                    int productIndex = ads.where((ad) => ad.id == conversations[index].adId).single.userId == currentUserId ? 1 : 0;
                    return ConversationTile(
                      userPhoto: users.where((user) => user.id == conversations[index].id!.split("-").where((conversationId) => conversationId != currentUserId && conversationId != conversations[index].adId).single).single.photo,
                      userNameSurname: users.where((user) => user.id == conversations[index].id!.split("-").where((conversationId) => conversationId != currentUserId && conversationId != conversations[index].adId).single).single.nameSurname,
                      message: conversations[index].messages == [] ? conversations[index].lastMessage!.text : "",
                      productPhoto: ads.where((ad) => ad.id == conversations[index].adId).single.products![productIndex].photo,
                      onTap: onTap,
                    );
                  },
                  closedElevation: elevation,
                  closedShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(conversationTileBorderRadius),
                      bottomRight: Radius.circular(conversationTileBorderRadius),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: containerPadding,
                );
              },
            );
          }
          return ListView(
            physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
          );
        },
      ),
    );
  }
}
