import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const String title = "takasburada";

const double buttonHeight = 48;
const double textFieldHeight = 48;
const double buttonBorderRadius = 24;
const double textFieldBorderRadius = 24;
const double textFieldBorderWidth = 1;
const double buttonElevation = 12;
const double containerPadding = 24;

const Color primaryColoredButtonColor = Color(0xff375675);
const Color borderedTextFieldBorderColor = Color(0xff375675);
const Color tabColor = Color(0xffF7EBB9);

TextStyle titleTextStyle = TextStyle(
  fontSize: 33,
  fontFamily: "Forte",
  color: Color(0xff375675),
  shadows: [
    Shadow(color: Colors.black, offset: Offset.zero, blurRadius: 33),
  ],
);

TextStyle backgroundedButtonTextSyle = GoogleFonts.robotoCondensed(
  fontSize: 24,
  fontWeight: FontWeight.bold,
  color: Color(0xff707070),
);

TextStyle primaryColoredButtonTextStyle = GoogleFonts.robotoCondensed(
  fontSize: 24,
  fontWeight: FontWeight.bold,
  color: Colors.white,
);

TextStyle textFieldHintTextStyle = GoogleFonts.robotoCondensed(
  fontSize: 18,
  fontWeight: FontWeight.normal,
  color: Color(0xff707070),
);

TextStyle tabTitleTextStyle = GoogleFonts.robotoCondensed(
  fontSize: 24,
  fontWeight: FontWeight.bold,
  color: Color(0xff707070),
  shadows: [
    Shadow(
        color: Colors.black.withOpacity(0.16),
        offset: Offset(0, 3),
        blurRadius: 6),
  ],
);
