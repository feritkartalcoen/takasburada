import 'package:flutter/material.dart' hide SnackBar;
import 'package:flutter/material.dart' as material show SnackBar;
import 'package:takasburada/constants/constants.dart';

class SnackBar {
  SnackBar._();
  static show(BuildContext context, String message, {SnackBarAction? action}) {
    ScaffoldMessenger.of(context).showSnackBar(
      material.SnackBar(
        duration: Duration(milliseconds: 800),
        backgroundColor: snackBarColor,
        action: action,
        elevation: elevation,
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.only(top: containerPadding),
        content: Text(message, style: snackBarTextSyle),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(borderRadius),
          topRight: Radius.circular(borderRadius),
        )),
      ),
    );
  }
}
