import 'package:flutter/material.dart';
import 'package:language/pages/home_page.dart';
import 'package:language/routes/routes_name.dart';

class AppRoutes {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.rootScreen:
        return MaterialPageRoute(builder: (_) => HomeScreen());
    }

    return MaterialPageRoute(
      builder: (_) => Scaffold(
        body: Center(
          child: Text('No route defined for ${settings.name}'),
        ),
      ),
    );
  }
}
