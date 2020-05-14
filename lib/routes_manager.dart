import 'package:flutter/material.dart';
import 'design/splash_screen.dart';
import 'utils/route_constants.dart';

class RouteManager {
  MaterialPageRoute<dynamic> route(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return MaterialPageRoute(builder: (context) => SplashScreen());
        break;
       }

    return null;
  }
}

RouteFactory get onGenerateRoute => RouteManager().route;
