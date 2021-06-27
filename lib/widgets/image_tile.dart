import 'dart:io';

import 'package:flutter/material.dart';
import 'package:takasburada/constants/constants.dart';

class ImageTile extends StatelessWidget {
  final String? photo;
  final VoidCallback? onTap;
  const ImageTile({
    Key? key,
    this.photo,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: elevation,
      borderRadius: BorderRadius.circular(borderRadius),
      child: InkWell(
        borderRadius: BorderRadius.circular(borderRadius),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(borderRadius),
          child: photo != ""
              ? Image.file(
                  File(photo!),
                  fit: BoxFit.cover,
                )
              : AspectRatio(
                  aspectRatio: 1,
                  child: Container(
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.add_photo_alternate,
                      size: iconButtonIconSize,
                      color: iconButtonIconColor,
                    ),
                  ),
                ),
        ),
        onTap: onTap ?? () {},
      ),
    );
  }
}
