import 'package:flutter/material.dart';

class NavProvider extends ChangeNotifier{
  int _navIndex =  0;

  int get getNavIndex => _navIndex;


  void setNavIndex(idx){
    _navIndex = idx;
    notifyListeners();
  }
}