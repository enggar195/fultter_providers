import 'package:enggarapps/config/route_config.dart';
import 'package:enggarapps/core/app.dart';
import 'package:equinox/equinox.dart' as eva;
import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:sailor/sailor.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with AfterLayoutMixin {
  @override
  Widget build(BuildContext context) {
    return eva.EqLayout(
      child: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.greenAccent,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Align(
              alignment: Alignment.topCenter,
              child: Image.asset('assets/img/1.png'),
            ),
            Text('Get Started', style: TextStyle(color: Colors.blue),)
          ],
        ),
      ),
    );
  }

  @override
  void afterFirstLayout(BuildContext context) async {
    await Future.delayed(Duration(seconds: 3));
    await App.main.sailor.navigate(
      RouteConfig.HOME,
      navigationType: NavigationType.pushAndRemoveUntil,
      removeUntilPredicate: (route) => false,
    );
  }
}
