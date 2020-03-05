import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ApplicationColor with ChangeNotifier {
  bool _isLightOrange = true;
  bool get isLightLightOrange => _isLightOrange;
  set isLightLightOrange(bool value) {
    _isLightOrange = value;
    notifyListeners();
  }

  Color get color => (_isLightOrange) ? Colors.deepOrangeAccent : Colors.grey;
}
