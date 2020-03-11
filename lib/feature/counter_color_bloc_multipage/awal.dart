import 'package:enggarapps/config/route_config.dart';
import 'package:enggarapps/core/app.dart';
import 'package:enggarapps/feature/counter_color_bloc_multipage/bloc/counter_bloc.dart';
import 'package:equinox/equinox.dart' as eva;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:enggarapps/feature/counter_color_bloc_multipage/bloc/color_bloc.dart';

class AwalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                builder: (context, number) => Text(
                  number.toString(),
                  style: TextStyle(
                      fontSize: 40, fontWeight: FontWeight.bold, color: color),
                ),
              ),
              RaisedButton(
                onPressed: () {
                  App.main.sailor.navigate(RouteConfig.CHANGENUMBERBLOC);
                },
                child: Text("Change Number Here !"),
                color: color,
              )
            ],
          ),
        ),
      ),
    );
  }
}
