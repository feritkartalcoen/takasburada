import 'package:flutter/material.dart' hide RefreshIndicator;
import 'package:takasburada/classes/ad.dart';
import 'package:takasburada/constants/constants.dart';
import 'package:takasburada/widgets/ad_tile.dart';
import 'package:provider/provider.dart';
import 'package:takasburada/providers/providers.dart' as providers;
import 'package:takasburada/widgets/refresh_indicator.dart';

class Feed extends StatefulWidget {
  const Feed({Key? key}) : super(key: key);

  @override
  _FeedState createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  List<Ad>? ads;

  @override
  void initState() {
    super.initState();
    getAds();
  }

  Future<void> getAds() async {
    context.read<providers.FirebaseProvider>().getAds().then(
      (value) {
        setState(() {
          ads = value;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: getAds,
      child: ads != null
          ? ListView.separated(
              physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
              padding: EdgeInsets.zero,
              itemCount: ads!.length,
              itemBuilder: (context, index) {
                return AdTile(
                  ad: ads![index],
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: containerPadding,
                );
              },
            )
          : Container(),
    );
  }
}
