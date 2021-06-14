import 'package:flutter/material.dart';
import 'package:takasburada/constants/constants.dart';

class IconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onTap;
  final bool withElevation;
  const IconButton({
    Key? key,
    this.withElevation = true,
    required this.icon,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: withElevation ? elevation : 0,
      borderRadius: BorderRadius.circular(iconButtonBorderRadius),
      child: InkWell(
        borderRadius: BorderRadius.circular(iconButtonBorderRadius),
        child: Container(
          width: iconButtonWidth,
          height: iconButtonHeight,
          alignment: Alignment.center,
          child: Icon(
            icon,
            size: iconButtonIconSize,
            color: iconButtonIconColor,
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}
