import 'package:flutter/material.dart';

class BottomNavigationBar with ChangeNotifier {
  int _bottomNavigationIndex = 0;
  int get bottomNavigationIndex => _bottomNavigationIndex;
  setbottomNavigationIndex(int index) {
    _bottomNavigationIndex = index;
    notifyListeners();
  }
}
