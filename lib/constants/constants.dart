import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const String customTitleHeroTag = "customTitle";
const String title = "takasburada";

const double adTileElevation = 12;
const double adTileBorderRadius = 24;
const double adTileActionItemWidth = 60;
const double adTileTradeIconWidth = 36;
const double adTileTradeIconHeight = 36;
const double adTileTradeIconBorderRadius = 18;
const double appBarHeight = 84;
const double appBarButtonHeight = 36;
const double appBarButtonWidth = 36;
const double appBarButtonBorderRadius = 18;
const double bottomAppBarHeight = 96;
const double bottomNavigationBarHeight = 48;
const double bottomNavigationBarElevation = 12;
const double bottomNavigationBarBorderRadius = 24;
const double bottomNavigationBarIndicatorHeight = 48;
const double buttonHeight = 48;
const double buttonBorderRadius = 24;
const double buttonElevation = 12;
const double chipHeight = 32;
const double chipBorderRadius = 16;
const double chipElevation = 12;
const double containerPadding = 24;
const double floatingActionButtonWidth = 48;
const double floatingActionButtonHeight = 48;
const double floatingActionButtonElevation = 12;
const double floatingActionButtonBorderRadius = 24;
const double iconButtonWidth = 48;
const double iconButtonHeight = 48;
const double iconButtonIconWidth = 24;
const double iconButtonIconHeight = 24;
const double iconButtonElevation = 12;
const double iconButtonBorderRadius = 24;
const double imageBorderRadius = 24;
const double imageElevation = 12;
const double messageTileBorderRadius = 24;
const double messageTileElevation = 12;
const double tabBarHeight = 48;
const double tabBorderRadius = 24;
const double tabBarIndicatorHeight = 48;
const double tabBarIndicatorBorderRadius = 24;
const double tabBarIndicatorElevation = 12;
const double textButtonHeight = 36;
const double textButtonBorderRadius = 18;
const double textFieldHeight = 48;
const double textFieldBorderRadius = 24;
const double textFieldBorderWidth = 1;

const Color primaryButtonColor = Color(0xff375675);
const Color secondaryButtonColor = Color(0xffF7EBB9);
const Color customBorderedTextFieldBorderColor = Color(0xff375675);
const Color tabColor = Color(0xffF7EBB9);
const Color tabBarIndicatorColor = Color(0xffF7EBB9);
const Color bottomNavigationBarColor = Color(0xffF7EBB9);
const Color floatingActionButtonColor = Color(0xff375675);

const int tabBarIndicatorAnimationDuration = 300;
const int bottomNavigationBarIndicatorAnimationDuration = 300;

TextStyle titleTextStyle = TextStyle(
  fontSize: 33,
  height: 36 / 33,
  fontFamily: "Forte",
  color: Color(0xff375675),
  shadows: [
    Shadow(color: Colors.black, offset: Offset.zero, blurRadius: 33),
  ],
);

TextStyle customBackgroundedButtonTextSyle = GoogleFonts.robotoCondensed(
  fontSize: 24,
  fontWeight: FontWeight.bold,
  color: Color(0xff707070),
);

TextStyle primaryButtonTextStyle = GoogleFonts.robotoCondensed(
  fontSize: 24,
  fontWeight: FontWeight.bold,
  color: Colors.white,
);

TextStyle secondaryButtonTextStyle = GoogleFonts.robotoCondensed(
  fontSize: 24,
  fontWeight: FontWeight.bold,
  color: Color(0xff707070),
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

TextStyle adProductNamesTextStyle = GoogleFonts.robotoCondensed(
  fontSize: 18,
  color: Color(0xff707070),
);

TextStyle adPostDateTextStyle = GoogleFonts.robotoCondensed(
  fontSize: 12,
  color: Color(0xff707070),
);

TextStyle labelTextStyle = GoogleFonts.robotoCondensed(
  fontSize: 18,
  fontWeight: FontWeight.bold,
  color: Color(0xff707070),
  shadows: [
    Shadow(
        color: Colors.black.withOpacity(0.16),
        offset: Offset(0, 3),
        blurRadius: 6),
  ],
);

TextStyle chipTextStyle = GoogleFonts.robotoCondensed(
  fontSize: 18,
  color: Color(0xff375675),
);

TextStyle messageTileSenderTextStyle = GoogleFonts.robotoCondensed(
  fontSize: 18,
  fontWeight: FontWeight.bold,
  color: Color(0xff707070),
);

TextStyle messageTileMessageTextStyle = GoogleFonts.robotoCondensed(
  fontSize: 16,
  color: Color(0xff707070),
);

TextStyle textButtonTextStyle = GoogleFonts.robotoCondensed(
  fontSize: 18,
  fontWeight: FontWeight.bold,
  color: Color(0xff707070),
  shadows: [
    Shadow(
        color: Colors.black.withOpacity(0.16),
        offset: Offset(0, 3),
        blurRadius: 6),
  ],
);

double tabBarIndicatorWidth(BuildContext context) {
  return (MediaQuery.of(context).size.width / 2) + (containerPadding / 2);
}

double tabBarItemWidth(BuildContext context) {
  return (MediaQuery.of(context).size.width - containerPadding) / 2;
}

double bottomNavigationBarIndicatorWidth(BuildContext context) {
  return (((MediaQuery.of(context).size.width) - 3 * containerPadding) -
          floatingActionButtonWidth) /
      3;
}

double bottomNavigationBarItemWidth(BuildContext context) {
  return (((MediaQuery.of(context).size.width) - 3 * containerPadding) -
          floatingActionButtonWidth) /
      3;
}

double adTileHeight(BuildContext context) {
  return ((MediaQuery.of(context).size.width - 60 - 24) / 2) + 48;
}

double adTileActionItemHeight(BuildContext context) {
  return (((MediaQuery.of(context).size.width - 60 - 24) / 2) + 48) / 3;
}

double adTileImageHeight(BuildContext context) {
  return ((MediaQuery.of(context).size.width - 60 - 24) / 2);
}
