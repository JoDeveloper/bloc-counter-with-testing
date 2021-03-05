import 'package:flutter/material.dart';

import '../screen/home_screen.dart';
import '../screen/second_screen.dart';
import '../screen/third_screen.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => HomeScreen(),
        );
        break;
      case '/second':
        return MaterialPageRoute(
          builder: (_) => SecondScreen(),
        );
        break;
      case '/third':
        return MaterialPageRoute(
          builder: (_) => ThirdScreen(),
        );
        break;
      default:
        return null;
    }
  }
}
