
import 'package:flutter/foundation.dart';

class CountMoney with ChangeNotifier{
  int _MyMoney=0;
  int get Money => _MyMoney;

  set Money(int value){
    _MyMoney=value;
    notifyListeners();

  }

}