import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  bool isdark = false;

  void toogletheme() {
    isdark = !isdark;
    notifyListeners();
  }
}
