import 'package:flutter/material.dart';


class Routes {
  static const String home = '/';
  
}

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.home:
        return MaterialPageRoute(builder: (_) => Container());
     
    }
    return null;
  }
}
