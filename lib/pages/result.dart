import 'package:flutter/material.dart' hide AppBar, IconButton, TextButton;
import 'package:takasburada/classes/ad.dart' hide ads;
import 'package:takasburada/constants/constants.dart';
import 'package:takasburada/constants/custom_icons.dart';
import 'package:takasburada/widgets/ad_tile.dart';
import 'package:takasburada/widgets/app_bar.dart';
import 'package:takasburada/widgets/icon_button.dart';
import 'package:takasburada/widgets/text_button.dart';
import 'package:provider/provider.dart';
import 'package:takasburada/providers/providers.dart' as providers;

class Result extends StatefulWidget {
  final VoidCallback? onTap;
  const Result({
    Key? key,
    this.onTap,
  }) : super(key: key);

  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
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
    return Scaffold(
      body: Column(
        children: [
          AppBar(
            withTitle: false,
            children: [
              IconButton(icon: CustomIcons.back, onTap: widget.onTap),
              Expanded(child: SizedBox()),
              TextButton(text: "filter", onTap: () {}),
              TextButton(text: "sort", onTap: () {}),
            ],
          ),
          Expanded(
            child: ads != null
                ? ListView.separated(
                    physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                    padding: EdgeInsets.zero,
                    itemCount: ads!.length,
                    itemBuilder: (context, index) {
                      return AdTile(ad: ads![index]);
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(height: containerPadding);
                    },
                  )
                : Container(),
          ),
        ],
      ),
    );
  }
}
