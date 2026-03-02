import 'package:flutter/material.dart';

class AppRoutes {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // Define your routes here
      // case Routes.home:
      //   return MaterialPageRoute(builder: (_) => HomeScreen());
      default:
        return MaterialPageRoute(
          builder:
              (_) => Scaffold(
                body: Center(
                  child: Text('No route defined for ${settings.name}'),
                ),
              ),
        );
    }
  }
}
