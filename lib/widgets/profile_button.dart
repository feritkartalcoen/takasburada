import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:takasburada/constants/constants.dart';
import 'package:provider/provider.dart';
import 'package:takasburada/providers/providers.dart' as providers;

class ProfileButton extends StatefulWidget {
  final VoidCallback? onTap;
  const ProfileButton({
    Key? key,
    this.onTap,
  }) : super(key: key);

  @override
  _ProfileButtonState createState() => _ProfileButtonState();
}

class _ProfileButtonState extends State<ProfileButton> {
  String? userPhoto;

  @override
  void initState() {
    super.initState();
    context.read<providers.Authentication>().userPhoto.then(
      (value) {
        setState(() {
          userPhoto = value;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: elevation,
      borderRadius: BorderRadius.circular(
        appBarButtonBorderRadius,
      ),
      child: Stack(
        children: [
          SizedBox(
            width: appBarButtonWidth,
            height: appBarButtonHeight,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(appBarButtonBorderRadius),
              child: userPhoto != null
                  ? CachedNetworkImage(
                      imageUrl: userPhoto!,
                      fit: BoxFit.fill,
                    )
                  : SizedBox(),
            ),
          ),
          Positioned.fill(
            child: Material(
              borderRadius: BorderRadius.circular(appBarButtonBorderRadius),
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(appBarButtonBorderRadius),
                onTap: widget.onTap,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
