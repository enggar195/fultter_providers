import 'package:enggarapps/feature/homePage/homePage.dart';
import 'package:sailor/sailor.dart';
import 'package:enggarapps/feature/splash/splash.dart';
import 'package:enggarapps/feature/change_color/change_color.dart';

class RouteConfig {

static const String SPLASH='/';
static const String HOME='/home'; 
static const String CHANGECOLOR='/hitung'; 

  static void configureMainRoutes(Sailor sailor) {
    sailor.addRoutes([
      SailorRoute(
        name: RouteConfig.SPLASH,
        builder: (context, args, params) => SplashScreen(),
      ),
      SailorRoute(
        name: RouteConfig.HOME,
        builder: (context, args, params) => HomeScreen(),
      ),
      SailorRoute(
        name: RouteConfig.CHANGECOLOR,
        builder: (context, args, params) => ChangeColor(),
      ),

    ]);
  }
}
