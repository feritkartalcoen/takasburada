import 'package:flutter/material.dart' hide AppBar, IconButton;
import 'package:takasburada/classes/ad.dart';
import 'package:takasburada/constants/constants.dart';
import 'package:takasburada/constants/custom_icons.dart';
import 'package:takasburada/widgets/ad_information_tile.dart';
import 'package:takasburada/widgets/ad_tile.dart';
import 'package:takasburada/widgets/app_bar.dart';
import 'package:takasburada/widgets/icon_button.dart';
import 'package:takasburada/widgets/profile_tile.dart';
import 'package:provider/provider.dart';
import 'package:takasburada/providers/providers.dart' as providers;

class Detail extends StatefulWidget {
  final Ad ad;
  const Detail({
    Key? key,
    required this.ad,
  }) : super(key: key);

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  String? userPhoto;
  String? userNameSurname;

  @override
  void initState() {
    super.initState();
    context.read<providers.FirebaseProvider>().getUser(widget.ad.userId!).then((value) {
      setState(() {
        userPhoto = value.photo;
        userNameSurname = value.nameSurname;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppBar(
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
                  onTap: () {},
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.only(
                top: containerPadding / 3,
                bottom: containerPadding,
              ),
              physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
              children: [
                ProfileTile(
                  userPhoto: userPhoto,
                  userNameSurname: userNameSurname,
                  onTap: () {},
                ),
                SizedBox(height: containerPadding),
                AdTile(ad: widget.ad, withActions: false),
                SizedBox(height: containerPadding),
                AdInformationTile(information: widget.ad.information!),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
