import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum MyRoutes { first, second, third }

class MyRouteInformationParser extends RouteInformationParser<MyRoutes> {
  @override
  Future<MyRoutes> parseRouteInformation(
      RouteInformation routeInformation) async {
    print('STATE OF APPS :: ${routeInformation.state}');
    switch (routeInformation.location) {
      case "/":
        return MyRoutes.first;
      case "/second":
        return MyRoutes.second;
      case "/third":
        return MyRoutes.third;
      default:
        return MyRoutes.first;
    }
  }

  @override
  RouteInformation restoreRouteInformation(MyRoutes configuration) {
    switch (configuration) {
      case MyRoutes.first:
        setLastRoute(configuration.index, '/');
        return const RouteInformation(location: '/');
      case MyRoutes.second:
        setLastRoute(configuration.index, '/second');
        return const RouteInformation(location: '/second');
      case MyRoutes.third:
        setLastRoute(configuration.index, '/third');
        return const RouteInformation(location: '/third');
    }
    // throw 'unknown';
  }

  setLastRoute(int visitedRoute, String location) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print('Called Method to record last route. $location');
    await prefs.setString('location', location);
    await prefs.setInt('LastRoute', visitedRoute);
  }
}
