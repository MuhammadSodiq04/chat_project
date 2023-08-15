import 'package:chat_project/app/app.dart';
import 'package:chat_project/ui/auth/auth_screen.dart';
import 'package:chat_project/ui/home/home_screen.dart';
import 'package:chat_project/ui/splash/splash_screen.dart';
import 'package:flutter/material.dart';

class RouteNames {
  static const String homeScreen = "/home_screen";
  static const String authScreen = "/auth_screen";
  static const String splashScreen = "/";
  static const String appScreen = "/app_screen";
}

class AppRoutes {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.appScreen:
        return MaterialPageRoute(
          builder: (context) => const App(),
        );
      case RouteNames.splashScreen:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );
      case RouteNames.authScreen:
        return MaterialPageRoute(
          builder: (context) => const AuthScreen(),
        );
      case RouteNames.homeScreen:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(
              child: Text("Route not found!"),
            ),
          ),
        );
    }
  }
}