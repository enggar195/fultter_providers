import 'package:enggarapps/feature/share_state/share_state.dart';
import 'package:flutter/material.dart';
import 'package:equinox/equinox.dart' as eva;
import 'package:provider/provider.dart';

class ChangeColor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ApplicationColor>(
      create: (context) => ApplicationColor(),
      child: eva.EqLayout(
        child: Consumer<ApplicationColor>(
          builder: (context, applicationColor, _) => Container(
            height: double.infinity,
            width: double.infinity,
            color: applicationColor.color,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(margin: EdgeInsets.all(5), child: Text("Grey")),
                    Consumer<ApplicationColor>(
                      builder: (context, applicationColor, _) => Container(
                        margin: EdgeInsets.all(5),
                        child: Switch(
                            value: applicationColor.isLightOrange,
                            onChanged: (newValue) {
                              applicationColor.isLightOrange = newValue;
                            }),
                      ),
                    ),
                    Container(margin: EdgeInsets.all(5), child: Text("Orange"))
                  ],
                ),
                // RaisedButton(
                //   child: Text('Save'),
                //   onPressed: () {
                //     Navigator.pop(context);
                //   },
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }

  // void saveValue(bool color) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.setBool('color', color);
  // }

  // Future<bool> getValue() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   return prefs.getBool('color' ?? false);
  // }
}
