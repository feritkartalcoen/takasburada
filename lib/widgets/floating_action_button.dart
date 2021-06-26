import 'package:flutter/material.dart';
import 'package:takasburada/constants/constants.dart';

class FloatingActionButton extends StatelessWidget {
  final Color? color;
  final double? fabElevation;
  final IconData icon;
  final VoidCallback? onTap;
  const FloatingActionButton({
    Key? key,
    this.color,
    this.fabElevation,
    required this.icon,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color ?? floatingActionButtonColor,
      elevation: fabElevation ?? elevation,
      borderRadius: BorderRadius.circular(borderRadius),
      child: InkWell(
        borderRadius: BorderRadius.circular(borderRadius),
        child: Container(
          width: floatingActionButtonWidth,
          height: floatingActionButtonHeight,
          alignment: Alignment.center,
          child: Icon(icon, color: floatingActionButtonIconColor),
        ),
        onTap: onTap,
      ),
    );
  }
}
