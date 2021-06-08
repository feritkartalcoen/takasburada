import 'package:flutter/material.dart';

class TabBarProvider with ChangeNotifier {
  int _tabIndex = 0;
  int get tabIndex => _tabIndex;
  setTabIndex(int index) {
    _tabIndex = index;
    notifyListeners();
  }
}
