import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:takasburada/constants/constants.dart';
import 'package:takasburada/providers/bottom_navigation_bar_provider.dart';

class FloatingActionButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onTap;
  const FloatingActionButton({
    Key? key,
    required this.icon,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Provider.of<BottomNavigationBarProvider>(context)
                  .bottomNavigationIndex !=
              2
          ? Colors.transparent
          : floatingActionButtonColor,
      elevation: Provider.of<BottomNavigationBarProvider>(context)
                  .bottomNavigationIndex !=
              2
          ? 0
          : elevation,
      borderRadius: BorderRadius.circular(floatingActionButtonBorderRadius),
      child: InkWell(
        borderRadius: BorderRadius.circular(floatingActionButtonBorderRadius),
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
