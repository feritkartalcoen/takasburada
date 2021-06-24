import 'package:flutter/material.dart' hide AppBar, IconButton;
import 'package:takasburada/classes/ad.dart';
import 'package:takasburada/classes/user.dart';
import 'package:takasburada/constants/constants.dart';
import 'package:takasburada/constants/custom_icons.dart';
import 'package:takasburada/pages/chat.dart';
import 'package:takasburada/widgets/ad_information_tile.dart';
import 'package:takasburada/widgets/ad_tile.dart';
import 'package:takasburada/widgets/app_bar.dart';
import 'package:takasburada/widgets/icon_button.dart';
import 'package:takasburada/widgets/profile_tile.dart';
import 'package:provider/provider.dart';
import 'package:takasburada/providers/providers.dart' as providers;

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
                  context.read<providers.FirebaseProvider>().createConversation(adId: ad.id!).then(
                    (result) {
                      print(result);
                      if (result == "conversation created") {
                        context.read<providers.FirebaseProvider>().getConversations().then(
                          (conversations) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Chat(
                                  conversation: conversations.where((conversation) => conversation.adId == ad.id).single,
                                  adId: ad.id!,
                                  userId: ad.userId!,
                                ),
                              ),
                            );
                          },
                        );
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
          FutureBuilder<User?>(
            future: context.read<providers.FirebaseProvider>().getUser(userId: ad.userId!),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                User user = snapshot.data!;
                return ProfileTile(
                  userPhoto: user.photo,
                  userNameSurname: user.nameSurname,
                  onTap: () {},
                );
              }
              return SizedBox();
            },
          ),
          SizedBox(height: containerPadding),
          AdTile(ad: ad, withActions: false),
          SizedBox(height: containerPadding),
          AdInformationTile(information: ad.information!),
        ],
      ),
    );
  }
}
