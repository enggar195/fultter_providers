import 'package:enggarapps/config/route_config.dart';
import 'package:enggarapps/core/app.dart';
import 'package:enggarapps/feature/change_color/share_state.dart';
import 'package:flutter/material.dart';
import 'package:equinox/equinox.dart' as eva;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChangeColor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ApplicationColor>(
      create: (context) => ApplicationColor(),
      child: eva.EqLayout(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.lightGreenAccent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Consumer<ApplicationColor>(
                builder: (context, applicationColor, _) => AnimatedContainer(
                  width: 300,
                  height: 300,
                  color:  applicationColor.color,
                  duration: Duration(milliseconds: 500),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(margin: EdgeInsets.all(5), child: Text("Grey")),
                  Consumer<ApplicationColor>(
                    builder: (context, applicationColor, _) => Container(
                        margin: EdgeInsets.all(5),
                        child: Switch(
                            value: applicationColor.isLightLightOrange,
                            onChanged: (newValue) {
                              applicationColor.isLightLightOrange = newValue;
                            })),
                  ),
                  Container(margin: EdgeInsets.all(5), child: Text("Orange"))
                ],
              ),
              RaisedButton(
                child: Text('Save'),
                onPressed: () {
                  
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  void saveValue(bool color) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('color', color);
  }

  Future<bool> getValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('color'??false);
  }
}
