import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart' hide SnackBar;
import 'package:takasburada/constants/constants.dart';
import 'package:takasburada/models/user.dart';
import 'package:takasburada/pages/login.dart';
import 'package:takasburada/widgets/snack_bar.dart';

class ProfileButton extends StatelessWidget {
  const ProfileButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: elevation,
      shape: CircleBorder(),
      child: Stack(
        children: [
          SizedBox(
            width: appBarButtonWidth,
            height: appBarButtonHeight,
            child: ClipOval(
              child: StreamBuilder<DocumentSnapshot<User>>(
                stream: User.getUser(userId: User.currentUserId),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return SizedBox();
                  }
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return SizedBox();
                  }
                  return CachedNetworkImage(
                    imageUrl: snapshot.data!.data()!.photo,
                    fit: BoxFit.fill,
                  );
                },
              ),
            ),
          ),
          Positioned.fill(
            child: Material(
              shape: CircleBorder(),
              color: Colors.transparent,
              child: InkWell(
                customBorder: CircleBorder(),
                onTap: () {
                  User.signOut().then((result) {
                    print("signed out");
                    SnackBar.show(context, "signed out");
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Login(),
                      ),
                    );
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
