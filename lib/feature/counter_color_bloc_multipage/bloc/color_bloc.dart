import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';

enum ColorEvent{ toBlue, toGrey, toGreen, toRed}

class ColorBloc extends Bloc<ColorEvent, Color>{
  @override
  // TODO: implement initialState
  Color get initialState => Colors.blueAccent;

  @override
  Stream<Color> mapEventToState(ColorEvent event) async* {
    // TODO: implement mapEventToState
    // yield 
    // (event == ColorEvent.toBlue)? Colors.blueAccent :(event == ColorEvent.toGreen) ? Colors.greenAccent:Colors.grey;
    if (event == ColorEvent.toBlue){
      yield Colors.blueAccent;
    } else if (event == ColorEvent.toGreen) {
      yield Colors.greenAccent;
    } else {
      yield Colors.grey;
    }
  }
  
}