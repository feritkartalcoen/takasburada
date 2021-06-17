import 'package:flutter/material.dart' hide SnackBar;
import 'package:flutter/material.dart' as material show SnackBar;
import 'package:takasburada/constants/constants.dart';

class SnackBar {
  SnackBar._();
  static show(BuildContext context, String message, {SnackBarAction? action}) {
    ScaffoldMessenger.of(context).showSnackBar(material.SnackBar(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      action: action,
      margin: EdgeInsets.all(containerPadding),
      behavior: SnackBarBehavior.floating,
      elevation: elevation,
      content: Text(message, style: snackBarTextSyle),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(snackBarBorderRadius)),
    ));
  }
}
