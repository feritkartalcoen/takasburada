import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart' hide AppBar, IconButton, TextButton;
import 'package:takasburada/models/ad.dart';
import 'package:takasburada/constants/constants.dart';
import 'package:takasburada/constants/custom_icons.dart';
import 'package:takasburada/models/product.dart';
import 'package:takasburada/models/user.dart';
import 'package:takasburada/widgets/ad_tile.dart';
import 'package:takasburada/widgets/app_bar.dart';
import 'package:takasburada/widgets/icon_button.dart';
import 'package:takasburada/widgets/text_button.dart';

class Result extends StatelessWidget {
  final VoidCallback? onTap;
  const Result({
    Key? key,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        withTitle: false,
        children: [
          IconButton(icon: CustomIcons.back, onTap: onTap),
          Expanded(child: SizedBox()),
          TextButton(text: "filter", onTap: () {}),
          TextButton(text: "sort", onTap: () {}),
        ],
      ),
      body: StreamBuilder<QuerySnapshot<Ad>>(
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
                            id: document["id"],
                            name: document["name"],
                            photo: document["photo"],
                            isGiven: document["isGiven"],
                          );
                        }).toList();
                        return AdTile(
                          ad: ad,
                        );
                      },
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: containerPadding,
                    );
                  },
                )
              : SizedBox();
        },
      ),
    );
  }
}
