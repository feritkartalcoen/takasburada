import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart' hide AppBar, IconButton, BottomAppBar, FloatingActionButton, TextField;
import 'package:takasburada/models/ad.dart';
import 'package:takasburada/models/conversation.dart';
import 'package:takasburada/models/user.dart';
import 'package:takasburada/constants/constants.dart';
import 'package:takasburada/constants/custom_icons.dart';
import 'package:takasburada/widgets/ad_information_tile.dart';
import 'package:takasburada/widgets/ad_tile.dart';
import 'package:takasburada/widgets/app_bar.dart';
import 'package:takasburada/widgets/bottom_app_bar.dart';
import 'package:takasburada/widgets/floating_action_button.dart';
import 'package:takasburada/widgets/icon_button.dart';
import 'package:takasburada/widgets/profile_tile.dart';
import 'package:takasburada/widgets/text_field.dart';

class Detail extends StatelessWidget {
  final Ad ad;
  Detail({
    Key? key,
    required this.ad,
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
                  showDialog(
                    context: context,
                    builder: (context) {
                      return Scaffold(
                        backgroundColor: Colors.transparent,
                        body: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.all(containerPadding),
                              child: IconButton(
                                icon: CustomIcons.back,
                                onTap: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ),
                            Spacer(),
                            BottomAppBar(
                              child: TextField(
                                autoFocus: true,
                                textEditingController: textEditingController,
                                textInputType: TextInputType.text,
                                hint: "type here",
                              ),
                              floatingActionButton: FloatingActionButton(
                                icon: CustomIcons.send,
                                onTap: () {
                                  Conversation.createConversation(ad: ad, text: textEditingController.text).then(
                                    (result) {
                                      print(result);
                                      if (result == "conversation created") {
                                        textEditingController.clear();
                                        Navigator.pop(context);
                                      } else if (result == "conversation exists") {
                                        textEditingController.clear();
                                        Navigator.pop(context);
                                      }
                                    },
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      );
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
