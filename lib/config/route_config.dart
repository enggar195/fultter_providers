import 'package:enggarapps/feature/homePage/homePage.dart';
import 'package:sailor/sailor.dart';
import 'package:enggarapps/feature/splash/splash.dart';
import 'package:enggarapps/feature/change_color/change_color.dart';
import 'package:enggarapps/feature/count_your_money/count_your_money.dart';
import 'package:enggarapps/feature/counter_color_bloc_multipage/awal.dart';
import 'package:enggarapps/feature/counter_color_bloc_multipage/ganti.dart';



class RouteConfig {

static const String SPLASH='/';
static const String HOME='/home'; 
static const String CHANGECOLOR='/hitung'; 
static const String COUNTMONEY='/count_money'; 
static const String NUMBERBLOC='/number_bloc'; 
static const String CHANGENUMBERBLOC='/count_money'; 



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
      SailorRoute(
        name: RouteConfig.COUNTMONEY,
        builder: (context, args, params) => CountYourMoney(),
      ),
      SailorRoute(
        name: RouteConfig.NUMBERBLOC,
        builder: (context, args, params) => AwalPage(),
      ),
      SailorRoute(
        name: RouteConfig.CHANGENUMBERBLOC,
        builder: (context, args, params) => Ganti(),
      ),

    ]);
  }
}
