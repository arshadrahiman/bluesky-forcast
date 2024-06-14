import 'package:flutter/material.dart';
import 'package:webtree_forcast/config/router/router_constants.dart';
import 'package:webtree_forcast/view/home/homescreen.dart';
import 'package:webtree_forcast/view/search/searchscreen.dart';
import 'package:webtree_forcast/view/splash/splashscreen.dart';

class AppRouter {
  static MaterialPageRoute generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppNamedRoute.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case AppNamedRoute.homeRoute:
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      case AppNamedRoute.searchRoute:
        return MaterialPageRoute(builder: (_) => const SearchScreen());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
