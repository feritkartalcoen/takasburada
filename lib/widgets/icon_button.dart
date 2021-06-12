import 'package:flutter/material.dart';
import 'package:takasburada/constants/constants.dart';

class IconButton extends StatelessWidget {
  final String icon;
  final VoidCallback? onTap;
  const IconButton({
    Key? key,
    required this.icon,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: iconButtonElevation,
      borderRadius: BorderRadius.circular(iconButtonBorderRadius),
      child: InkWell(
        borderRadius: BorderRadius.circular(iconButtonBorderRadius),
        child: Container(
          width: iconButtonWidth,
          height: iconButtonHeight,
          alignment: Alignment.center,
          child: Image.asset(
            icon,
            width: iconButtonIconWidth,
            height: iconButtonIconHeight,
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}