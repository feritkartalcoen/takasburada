import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Bu dosyada uygulamada kullanılan Widget'ların
// değerleri, stilleri verilmiştir.
// Hiçbir widget hard kodlanmamıştır. Bu
// dosyadaki değişkenler kullanılmaktadır.
const String titleHeroTag = "customTitle";
const String title = "takas burada";

const int bottomNavigationBarIndicatorAnimationDuration = 300;
const int tabBarIndicatorAnimationDuration = 300;
const int snackBarAnimationDuration = 800;

const double adTileActionItemWidth = 60;
const double adTileActionIconSize = 20;
const double adTileTradeIconWidth = 36;
const double adTileTradeIconHeight = 36;
const double adTileIconSize = 18;
const double appBarHeight = 84;
const double appBarButtonHeight = 36;
const double appBarButtonWidth = 36;
const double borderRadius = 24;
const double bottomAppBarHeight = 96;
const double bottomNavigationBarHeight = 48;
const double bottomNavigationBarIndicatorHeight = 48;
const double buttonHeight = 48;
const double chipHeight = 32;
const double containerPadding = 24;
const double elevation = 12;
const double floatingActionButtonWidth = 48;
const double floatingActionButtonHeight = 48;
const double iconButtonWidth = 48;
const double iconButtonHeight = 48;
const double iconButtonIconSize = 24;
const double messageTileHeight = 36;
const double refreshIndicatorDisplacement = 0;
const double refreshIndicatorStrokeWidth = 3;
const double smallBorderRadius = 18;
const double tabBarHeight = 48;
const double tabBarIndicatorHeight = 48;
const double textButtonHeight = 36;
const double textFieldHeight = 48;
const double textFieldBorderWidth = 1;

const Color adTileActionsIconColor = Color(0xff707070);
const Color bottomNavigationBarColor = Color(0xffF7EBB9);
const Color bottomNavigationBarIconColor = Color(0xff707070);
const Color customBorderedTextFieldBorderColor = Color(0xff375675);
const Color floatingActionButtonColor = Color(0xff375675);
const Color floatingActionButtonIconColor = Colors.white;
const Color iconColor = Color(0xff707070);
const Color iconButtonIconColor = Color(0xff707070);
const Color primaryButtonColor = Color(0xff375675);
const Color refreshIndicatorBackgroundColor = Color(0xff375675);
const Color refreshIndicatorIconColor = Colors.white;
const Color secondaryButtonColor = Color(0xffF7EBB9);
const Color snackBarColor = Color(0xff375675);
const Color tabColor = Color(0xffF7EBB9);
const Color tabBarIndicatorColor = Color(0xffF7EBB9);

TextStyle titleTextStyle = TextStyle(
  fontSize: 33,
  height: 36 / 33,
  fontFamily: "Forte",
  shadows: [
    Shadow(color: Colors.black, offset: Offset.zero, blurRadius: 33),
  ],
);

TextStyle titleFirstTextStyle = TextStyle(
  color: Color(0xff375675),
);

TextStyle titleSecondTextStyle = TextStyle(
  color: Color(0xffF7EBB9),
);

TextStyle backgroundedButtonTextSyle = GoogleFonts.robotoCondensed(
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
  fontWeight: FontWeight.bold,
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

TextStyle listTileTitleTextStyle = GoogleFonts.robotoCondensed(
  fontSize: 18,
  fontWeight: FontWeight.bold,
  color: Color(0xff707070),
);

TextStyle listTileReceivedSubtitleTextStyle = GoogleFonts.robotoCondensed(
  fontSize: 16,
  color: Color(0xff707070),
);

TextStyle listTileSentSubtitleTextStyle = GoogleFonts.robotoCondensed(
  fontSize: 16,
  color: Color(0xff375675),
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

TextStyle chatTileReceivedTextStyle = GoogleFonts.robotoCondensed(
  fontSize: 18,
  color: Color(0xff707070),
);

TextStyle chatTileSentTextStyle = GoogleFonts.robotoCondensed(
  fontSize: 18,
  color: Color(0xff375675),
);

TextStyle adInformationTileTitleTextStyle = GoogleFonts.robotoCondensed(
  fontSize: 18,
  fontWeight: FontWeight.bold,
  color: Color(0xff707070),
);

TextStyle adInformationTileTextStyle = GoogleFonts.robotoCondensed(
  fontSize: 18,
  color: Color(0xff707070),
);

TextStyle snackBarTextSyle = GoogleFonts.robotoCondensed(
  fontSize: 18,
  fontWeight: FontWeight.bold,
  color: Colors.white,
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

double adTileHeightWithoutActions(BuildContext context) {
  return ((MediaQuery.of(context).size.width - 24) / 2) + 48;
}

double adTileActionItemHeight(BuildContext context) {
  return (((MediaQuery.of(context).size.width - 60 - 24) / 2) + 48) / 3;
}

double adTileImageHeight(BuildContext context) {
  return ((MediaQuery.of(context).size.width - 60 - 24) / 2);
}

double adTileImageHeightWithoutActions(BuildContext context) {
  return ((MediaQuery.of(context).size.width - 24) / 2);
}

const String loremIpsumParagraph =
    "lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. vulputate dignissim suspendisse in est.";
