
import 'package:flutter/foundation.dart';

class CountCart with ChangeNotifier{
  int _MyCart=1;
  int get Cart => _MyCart;

  set Cart(int value){
    _MyCart=value;
    notifyListeners();

  }

}