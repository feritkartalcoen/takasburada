import 'package:flutter/material.dart';
import 'package:takasburada/constants/constants.dart';

class FloatingActionButton extends StatelessWidget {
  final String icon;
  final VoidCallback? onTap;
  const FloatingActionButton({
    Key? key,
    required this.icon,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: floatingActionButtonColor,
      elevation: floatingActionButtonElevation,
      borderRadius: BorderRadius.circular(floatingActionButtonBorderRadius),
      child: InkWell(
        borderRadius: BorderRadius.circular(floatingActionButtonBorderRadius),
        child: Container(
          width: floatingActionButtonWidth,
          height: floatingActionButtonHeight,
          alignment: Alignment.bottomCenter,
          child: Image.asset(icon),
        ),
        onTap: onTap,
      ),
    );
  }
}
