import 'package:flutter/material.dart';

class IndexProvider with ChangeNotifier {
  int _tabIndex = 0;
  int _bottomNavigationIndex = 0;
  set tabIndex(int index) {
    _tabIndex = index;
    notifyListeners();
  }

  set bottomNavigationIndex(int index) {
    _bottomNavigationIndex = index;
    notifyListeners();
  }

  int get tabIndex => _tabIndex;
  int get bottomNavigationIndex => _bottomNavigationIndex;
}
