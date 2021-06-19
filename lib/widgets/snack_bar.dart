import 'package:flutter/material.dart' hide SnackBar;
import 'package:flutter/material.dart' as material show SnackBar;
import 'package:takasburada/constants/constants.dart';

class SnackBar {
  SnackBar._();
  static show(BuildContext context, String message, {SnackBarAction? action}) {
    ScaffoldMessenger.of(context).showSnackBar(
      material.SnackBar(
        backgroundColor: snackBarColor,
        action: action,
        elevation: elevation,
        content: Text(message, style: snackBarTextSyle),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(snackBarBorderRadius),
          topRight: Radius.circular(snackBarBorderRadius),
        )),
      ),
    );
  }
}
