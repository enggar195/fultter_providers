import 'package:enggarapps/config/route_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grpc/grpc.dart';
import 'package:sailor/sailor.dart';
import 'package:get_it/get_it.dart';

class App {
  static App get main => GetIt.instance.get<App>();

  final String title;
  final Sailor sailor;
  final ClientChannel channel;
  App({
    @required this.title,
    @required this.sailor,
    @required this.channel,
  });

  Future<Null> init() async {
    RouteConfig.configureMainRoutes(sailor);
  }

  void screenUtil(BuildContext context) {
    ScreenUtil.init(context, width: 360, height: 640, allowFontScaling: true);
  }

  void debug(String msg) {
    print('Hello Enggar >> $msg');
  }

  bool _isLightOrange = true;

  bool get isLightOrange => _isLightOrange;
  
  set isLightOrange(bool value) {
    _isLightOrange = value;
  }
}
