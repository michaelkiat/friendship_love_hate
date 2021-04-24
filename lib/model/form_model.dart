import 'package:flutter/material.dart';

class FormModel extends ChangeNotifier {
  String _maleName;
  String get maleName => _maleName;

  String _femaleName;
  String get femaleName => _femaleName;

  void setMaleName(String name) => _maleName = name;
  void setFemaleName(String name) => _femaleName = name;

  FormModel();

  void clearData() {
    _maleName = null;
    _femaleName = null;
    notifyListeners();
  }
}
