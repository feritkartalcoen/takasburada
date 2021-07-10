import 'package:flutter/widgets.dart';

// Uygulamada kullanılan simgelerin referansları
// burada yer almaktadır. FLutter da simgeler 
// Font dosyasında depolanır. O yüzden eğer özel
// simgeler kullanılacaksa bir font oluşturmak gerekir.
class CustomIcons {
  CustomIcons._();

  // CustomIcons.ttf dosyası (fonts klasörü altında)
  // fontFamily olarak kullanılmaktadır.
  static const String fontFamily = "CustomIcons";

  static const IconData add = IconData(0xe800, fontFamily: fontFamily);
  static const IconData back = IconData(0xe801, fontFamily: fontFamily);
  static const IconData chat = IconData(0xe802, fontFamily: fontFamily);
  static const IconData check = IconData(0xe803, fontFamily: fontFamily);
  static const IconData favorite = IconData(0xe804, fontFamily: fontFamily);
  static const IconData home = IconData(0xe805, fontFamily: fontFamily);
  static const IconData media = IconData(0xe806, fontFamily: fontFamily);
  static const IconData more = IconData(0xe807, fontFamily: fontFamily);
  static const IconData search = IconData(0xe808, fontFamily: fontFamily);
  static const IconData send = IconData(0xe809, fontFamily: fontFamily);
  static const IconData share = IconData(0xe80a, fontFamily: fontFamily);
  static const IconData trade = IconData(0xe80b, fontFamily: fontFamily);
  static const IconData trash = IconData(0xe80c, fontFamily: fontFamily);
}
