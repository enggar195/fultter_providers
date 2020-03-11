import 'package:enggarapps/feature/counter_color_bloc_multipage/bloc/counter_bloc.dart';
import 'package:equinox/equinox.dart' as eva;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:enggarapps/feature/counter_color_bloc_multipage/bloc/color_bloc.dart';

class Ganti extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ColorBloc colorBloc = BlocProvider.of<ColorBloc>(context);
    CounterBloc counterBloc=BlocProvider.of<CounterBloc>(context);
    return BlocBuilder<ColorBloc, Color>(
      builder: (context, color) => eva.EqLayout(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.yellowAccent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              BlocBuilder<CounterBloc, int>(
                builder: (context, number) => GestureDetector(
                  onTap: (){counterBloc.add(number+1);},
                                  child: Text(
                    number.toString(),
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: color),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    onPressed: () { colorBloc.add(ColorEvent.toBlue);},
                    color: Colors.blueAccent,
                    shape:(color == Colors.blueAccent) ? CircleBorder(side:BorderSide(color: Colors.black, width:3)): CircleBorder(),
                  ),
                  RaisedButton(
                    onPressed: () {colorBloc.add(ColorEvent.toGreen);},
                    color: Colors.greenAccent,
                    shape:(color == Colors.greenAccent) ? CircleBorder(side:BorderSide(color: Colors.black, width:3)): CircleBorder(),

                  ),
                  RaisedButton(
                    onPressed: () {colorBloc.add(ColorEvent.toGrey);},
                    color: Colors.grey,
                    shape:(color == Colors.grey) ? CircleBorder(side:BorderSide(color: Colors.black, width:3)): CircleBorder(),

                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
