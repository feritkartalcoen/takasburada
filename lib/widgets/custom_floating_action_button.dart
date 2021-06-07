import 'package:flutter/material.dart';
import 'package:takasburada/constants/constants.dart';

class CustomFloatingActionButton extends StatelessWidget {
  final String image;
  final VoidCallback onTap;
  const CustomFloatingActionButton({
    Key? key,
    required this.image,
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
          child: Image.asset(image),
        ),
        onTap: onTap,
      ),
    );
  }
}
