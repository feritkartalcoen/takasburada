import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart' hide RefreshIndicator;
import 'package:takasburada/constants/constants.dart';
import 'package:takasburada/models/ad.dart';
import 'package:takasburada/models/product.dart';
import 'package:takasburada/models/user.dart';
import 'package:takasburada/widgets/ad_tile.dart';
import 'package:takasburada/widgets/refresh_indicator.dart';

class Feed extends StatefulWidget {
  const Feed({Key? key}) : super(key: key);

  @override
  _FeedState createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        Future.delayed(Duration(milliseconds: 350), () {
          setState(() {});
        });
      },
      child: FutureBuilder<QuerySnapshot<Ad>>(
        future: Ad.getAdsAsFuture(),
        builder: (context, adsSnapshot) {
          if (adsSnapshot.connectionState == ConnectionState.done) {
            List<Ad> ads = adsSnapshot.data!.docs.map((document) => document.data()).toList().where((ad) => ad.userId != User.currentUserId).toList();
            return ListView.separated(
              physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
              padding: EdgeInsets.zero,
              itemCount: ads.length,
              itemBuilder: (context, index) {
                Ad ad = ads[index];
                return FutureBuilder<QuerySnapshot<Product>>(
                  future: Product.getProductsAsFuture(adId: ad.id),
                  builder: (context, productsSnapshot) {
                    if (productsSnapshot.connectionState == ConnectionState.done) {
                      List<Product> products = productsSnapshot.data!.docs.map((document) => document.data()).toList();
                      return AdTile(
                        ad: Ad(
                          id: ad.id,
                          userId: ad.userId,
                          products: products,
                          date: ad.date,
                          information: ad.information,
                        ),
                      );
                    } else {
                      return SizedBox();
                    }
                  },
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(height: containerPadding);
              },
            );
          } else {
            return SizedBox();
          }
        },
      ),
    );
  }
}
