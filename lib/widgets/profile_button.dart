import 'package:flutter/material.dart';
import 'package:takasburada/constants/constants.dart';
import 'package:provider/provider.dart';
import 'package:takasburada/providers/providers.dart' as providers;

class ProfileButton extends StatelessWidget {
  final VoidCallback? onTap;
  const ProfileButton({
    Key? key,
    this.onTap,
  }) : super(key: key);

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
              child: FutureBuilder<String>(
                future: context.read<providers.Authentication>().userPhoto,
                builder: (context, snapshot) {
                  return snapshot.connectionState == ConnectionState.done
                      ? Image.network(
                          snapshot.data!,
                          fit: BoxFit.fill,
                        )
                      : CircularProgressIndicator();
                },
              ),
            ),
          ),
          Positioned.fill(
            child: Material(
              borderRadius: BorderRadius.circular(appBarButtonBorderRadius),
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(appBarButtonBorderRadius),
                onTap: onTap,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
