import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart' hide RefreshIndicator;
import 'package:takasburada/models/ad.dart';
import 'package:takasburada/models/conversation.dart';
import 'package:takasburada/models/message.dart';
import 'package:takasburada/models/product.dart';
import 'package:takasburada/models/user.dart';
import 'package:takasburada/constants/constants.dart';
import 'package:takasburada/pages/chat.dart';
import 'package:takasburada/widgets/conversation_tile.dart';

class Conversations extends StatelessWidget {
  const Conversations({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Conversation>>(
      stream: Conversation.getConversations(),
      builder: (context, conversationsSnapshot) {
        if (conversationsSnapshot.hasError) {
          return SizedBox();
        }
        if (conversationsSnapshot.connectionState == ConnectionState.waiting) {
          return SizedBox();
        }
        List<Conversation> conversations = conversationsSnapshot.data!.docs.map((document) => document.data()).toList().where((conversation) => conversation.id.contains(User.currentUserId)).toList();
        return conversations != []
            ? ListView.separated(
                physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                padding: EdgeInsets.only(right: containerPadding),
                itemCount: conversations.length,
                itemBuilder: (context, index) {
                  Conversation conversation = conversations[index];
                  return StreamBuilder<QuerySnapshot<Message>>(
                    stream: Message.getMessages(conversationId: conversation.id),
                    builder: (context, messagesSnapshot) {
                      if (messagesSnapshot.hasError) {
                        return SizedBox();
                      }
                      if (messagesSnapshot.connectionState == ConnectionState.waiting) {
                        return SizedBox();
                      }
                      conversation.messages = messagesSnapshot.data!.docs.map((document) {
                        return Message(
                          id: document.data().id,
                          userId: document.data().userId,
                          text: document.data().text,
                          date: document.data().date,
                        );
                      }).toList();
                      return StreamBuilder<DocumentSnapshot<Ad>>(
                        stream: Ad.getAd(adId: conversation.adId),
                        builder: (context, adSnapshot) {
                          if (adSnapshot.hasError) {
                            return SizedBox();
                          }
                          if (adSnapshot.connectionState == ConnectionState.waiting) {
                            return SizedBox();
                          }
                          Ad ad = adSnapshot.data!.data()!;
                          return StreamBuilder<QuerySnapshot<Product>>(
                            stream: Product.getProducts(adId: ad.id),
                            builder: (context, productsSnapshot) {
                              if (productsSnapshot.hasError) {
                                return SizedBox();
                              }
                              if (productsSnapshot.connectionState == ConnectionState.waiting) {
                                return SizedBox();
                              }
                              ad.products = productsSnapshot.data!.docs.map((document) {
                                return Product(
                                  id: document.data().id,
                                  name: document.data().name,
                                  photo: document.data().photo,
                                  isGiven: document.data().isGiven,
                                );
                              }).toList();
                              String userId = conversation.id.split("-").where((conversationId) => conversationId != User.currentUserId && conversationId != conversations[index].adId).single;
                              return StreamBuilder<DocumentSnapshot<User>>(
                                stream: User.getUser(userId: userId),
                                builder: (context, userSnapshot) {
                                  if (userSnapshot.hasError) {
                                    return SizedBox();
                                  }
                                  if (userSnapshot.connectionState == ConnectionState.waiting) {
                                    return SizedBox();
                                  }
                                  User user = userSnapshot.data!.data()!;
                                  return ConversationTile(
                                    userPhoto: user.photo,
                                    userNameSurname: user.nameSurname,
                                    message: conversation.lastMessage!,
                                    productPhoto: ad.userId == User.currentUserId ? ad.products!.where((product) => product.isGiven == false).single.photo : ad.products!.where((product) => product.isGiven == true).single.photo,
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => Chat(
                                            conversationId: conversation.id,
                                            user: user,
                                          ),
                                        ),
                                      );
                                    },
                                    onLongPress: () {
                                      Conversation.deleteConversation(conversationId: conversation.id);
                                    },
                                  );
                                },
                              );
                            },
                          );
                        },
                      );
                    },
                  );
                },
                separatorBuilder: (context, index) => SizedBox(height: containerPadding),
              )
            : SizedBox();
      },
    );
  }
}
