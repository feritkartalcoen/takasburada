import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const String title = "takasburada";

const double buttonHeight = 48;
const double buttonBorderRadius = 24;
const double buttonElevation = 8;
const double containerPadding = 24;

TextStyle titleTextStyle = TextStyle(
  fontSize: 33,
  fontFamily: "Forte",
  color: Color(0xff375675),
  shadows: [
    Shadow(color: Colors.black, offset: Offset.zero, blurRadius: 33),
  ],
);

TextStyle backgroundButtonTextSyle = GoogleFonts.robotoCondensed(
  fontSize: 24,
  fontWeight: FontWeight.bold,
  color: Color(0xff707070),
);
