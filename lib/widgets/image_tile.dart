import 'package:flutter/material.dart';
import 'package:takasburada/constants/constants.dart';

class ImageTile extends StatelessWidget {
  final String image;
  const ImageTile({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: elevation,
      borderRadius: BorderRadius.circular(imageBorderRadius),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(imageBorderRadius),
        child: Image.asset(image, fit: BoxFit.cover),
      ),
    );
  }
}
