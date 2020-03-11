import 'package:enggarapps/core/app.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ApplicationColor with ChangeNotifier {
  // static bool _isLightOrange = App.main.isLightOrange;
  bool get isLightOrange => App.main.isLightOrange;
  set isLightOrange(bool value) {
    App.main.isLightOrange = value;
    notifyListeners();
  }

  Color get color => (App.main.isLightOrange) ? Colors.deepOrangeAccent : Colors.grey;
}
