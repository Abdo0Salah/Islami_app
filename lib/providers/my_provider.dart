import 'package:flutter/material.dart';

class MyProvider extends ChangeNotifier{
  String language ='ar';
  ThemeMode myTheme =ThemeMode.dark;
  changeLanguage(lan){
    language=lan;
    notifyListeners();
  }
  changeTheme(theme){
    myTheme=theme;
    notifyListeners();
  }
  getBackgroundImg( ) {
    return ThemeMode.light== myTheme
        ? "assets/images/img.png"
        : "assets/images/img_1.png";
  }
}