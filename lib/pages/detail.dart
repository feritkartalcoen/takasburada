import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart' hide AppBar, IconButton;
import 'package:takasburada/models/ad.dart';
import 'package:takasburada/models/conversation.dart';
import 'package:takasburada/models/user.dart';
import 'package:takasburada/constants/constants.dart';
import 'package:takasburada/constants/custom_icons.dart';
import 'package:takasburada/widgets/ad_information_tile.dart';
import 'package:takasburada/widgets/ad_tile.dart';
import 'package:takasburada/widgets/app_bar.dart';
import 'package:takasburada/widgets/icon_button.dart';
import 'package:takasburada/widgets/profile_tile.dart';

class Detail extends StatelessWidget {
  final Ad ad;
  const Detail({
    Key? key,
    required this.ad,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        withTitle: false,
        children: [
          IconButton(
            icon: CustomIcons.back,
            onTap: () {
              Navigator.pop(context);
            },
          ),
          Expanded(child: SizedBox()),
          ...adTileIcons.map(
            (icon) => IconButton(
              withElevation: false,
              icon: icon,
              onTap: () {
                if (icon == CustomIcons.chat) {
                  Conversation.createConversation(ad: ad).then(
                    (result) {
                      print(result);
                      if (result == "conversation created") {
                        /* context.read<providers.FirebaseProvider>().getConversations().then(
                          (conversations) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Chat(
                                  conversation: conversations.where((conversation) => conversation.adId == ad.id).single,
                                  adId: ad.id,
                                  userId: ad.userId,
                                ),
                              ),
                            );
                          },
                        ); */
                      }
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.only(
          top: containerPadding / 3,
          bottom: containerPadding,
        ),
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        children: [
          StreamBuilder<DocumentSnapshot<User>>(
            stream: User.getUser(userId: ad.userId),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return ProfileTile(
                  userPhoto: null,
                  userNameSurname: "",
                  onTap: () {},
                );
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return ProfileTile(
                  userPhoto: null,
                  userNameSurname: "",
                  onTap: () {},
                );
              }
              return ProfileTile(
                userPhoto: snapshot.data!.data()!.photo,
                userNameSurname: snapshot.data!.data()!.nameSurname,
                onTap: () {},
              );
            },
          ),
          SizedBox(height: containerPadding),
          AdTile(ad: ad, withActions: false),
          SizedBox(height: containerPadding),
          AdInformationTile(information: ad.information),
        ],
      ),
      resizeToAvoidBottomInset: true,
    );
  }
}
