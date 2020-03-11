import 'package:enggarapps/config/route_config.dart';
import 'package:enggarapps/core/app.dart';
import 'package:enggarapps/feature/share_state/share_state.dart';
import 'package:flutter/material.dart';
import 'package:equinox/equinox.dart' as eva;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
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
                Align(
                  alignment: Alignment.topCenter,
                  child: Image.asset('assets/img/2.png'),
                ),
                RaisedButton(
                  child: Text('Change color background'),
                  onPressed: () {
                    App.main.sailor.navigate(RouteConfig.CHANGECOLOR);
                  },
                ),
                RaisedButton(
                  child: Text('Count Your Money'),
                  onPressed: () {
                    App.main.sailor.navigate(RouteConfig.COUNTMONEY);
                  },
                ),
                 RaisedButton(
                 child: Text('Try BLOC'),
                  onPressed: () {
                    App.main.sailor.navigate(RouteConfig.NUMBERBLOC);
                  },
                ),
              ],
            ),
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
