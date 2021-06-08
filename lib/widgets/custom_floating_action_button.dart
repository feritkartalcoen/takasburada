import 'package:flutter/material.dart';
import 'package:takasburada/constants/constants.dart';

class CustomFloatingActionButton extends StatelessWidget {
  final String icon;
  final VoidCallback onTap;
  const CustomFloatingActionButton({
    Key? key,
    required this.icon,
    required this.onTap,
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
