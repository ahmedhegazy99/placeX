import 'package:client/screens/authenticate/accountRegister.dart';
import 'package:client/screens/authenticate/login.dart';
import 'package:client/screens/places.dart';
import 'package:client/screens/splash.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:client/mainBar.dart';
import 'package:client/screens/account.dart';

class AppRouter {
  // General
  static const String homeRoute = '/';
  static const String aboutRoute = '/about';
  static const String contactRoute = '/contactUs';
  static const String splashRoute = '/splash';
  static const String mainBarRoute = '/mainBar';
  static const String createPlaceRoute = '/createPlace';
  static const String placeProfileRoute = '/PlaceProfile';

  // Auth
  static const String loginRoute = '/login';
  static const String registerRoute = '/signUp';

  // User
  static const String accountRoute = '/accountProfile';

  static Route<dynamic> generateGlobalRoutes(RouteSettings settings) {
    switch (settings.name) {
      case "\\":
      case homeRoute:
        return MaterialPageRoute(builder: (_) => Places(), settings: settings);
      case splashRoute:
        return MaterialPageRoute(builder: (_) => Splash(), settings: settings);
      case loginRoute:
        return MaterialPageRoute(builder: (_) => Login(), settings: settings);
      case registerRoute:
        return MaterialPageRoute(builder: (_) => AccountRegister(), settings: settings);
      case mainBarRoute:
        return MaterialPageRoute(builder: (_) => MainBar(), settings: settings);
      case accountRoute:
        return MaterialPageRoute(builder: (_) => Account(), settings: settings);
      /*case createPlaceRoute:
          return MaterialPageRoute(builder: (_) => CreatePlace(), settings: settings);*/
      /*case placeProfileRoute:
        return MaterialPageRoute(
            builder: (_) => PlaceProfile(), settings: settings);*/
      default:
        return MaterialPageRoute(builder: (_) => MainBar(), settings: settings);
    }
  }
}


