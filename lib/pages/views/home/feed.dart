import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:takasburada/constants/constants.dart';
import 'package:takasburada/models/ad.dart';
import 'package:takasburada/models/product.dart';
import 'package:takasburada/models/user.dart';
import 'package:takasburada/widgets/ad_tile.dart';

class Feed extends StatelessWidget {
  const Feed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Ad>>(
      stream: Ad.getAds(),
      builder: (context, adsSnapshot) {
        if (adsSnapshot.hasError) {
          return SizedBox();
        }
        if (adsSnapshot.connectionState == ConnectionState.waiting) {
          return SizedBox();
        }
        List<Ad> ads = adsSnapshot.data!.docs.map((document) => document.data()).toList().where((ad) => ad.userId != User.currentUserId).toList();
        return ads != []
            ? ListView.separated(
                physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                padding: EdgeInsets.zero,
                itemCount: ads.length,
                itemBuilder: (context, index) {
                  Ad ad = ads[index];
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
                      return AdTile(
                        ad: ad,
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
