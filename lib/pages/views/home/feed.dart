import 'package:flutter/material.dart' hide RefreshIndicator;
import 'package:takasburada/classes/ad.dart';
import 'package:takasburada/constants/constants.dart';
import 'package:takasburada/widgets/ad_tile.dart';
import 'package:provider/provider.dart';
import 'package:takasburada/providers/providers.dart' as providers;
import 'package:takasburada/widgets/refresh_indicator.dart';

class Feed extends StatelessWidget {
  const Feed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String currentUserId = context.read<providers.FirebaseProvider>().firebaseAuth.currentUser!.uid;
    return RefreshIndicator(
      onRefresh: context.read<providers.FirebaseProvider>().getAds,
      child: FutureBuilder<List<Ad>>(
        future: context.read<providers.FirebaseProvider>().getAds(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            List<Ad> ads = snapshot.data!.where((ad) => ad.userId != currentUserId).toList();
            return ListView.separated(
              physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
              padding: EdgeInsets.zero,
              itemCount: ads.length,
              itemBuilder: (context, index) {
                return AdTile(
                  ad: ads[index],
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
