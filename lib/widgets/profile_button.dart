import 'package:flutter/material.dart';
import 'package:takasburada/constants/constants.dart';

class ProfileButton extends StatelessWidget {
  const ProfileButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: buttonElevation,
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
              child: Image.asset(
                "images/profile.png",
                fit: BoxFit.fill,
              ),
            ),
          ),
          Positioned.fill(
            child: Material(
              borderRadius: BorderRadius.circular(appBarButtonBorderRadius),
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(appBarButtonBorderRadius),
                onTap: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
