import 'package:flutter/material.dart';

enum MyRoutes { first, second, third }

class MyRouteInformationParser extends RouteInformationParser<MyRoutes> {
  @override
  Future<MyRoutes> parseRouteInformation(
      RouteInformation routeInformation) async {
    switch (routeInformation.location) {
      case "/":
        return MyRoutes.first;
        break;
      case "/second":
        return MyRoutes.second;
        break;
      case "/third":
        return MyRoutes.third;
        break;
      default:
        return MyRoutes.first;
        break;
    }
  }

  @override
  RouteInformation restoreRouteInformation(MyRoutes configuration) {
    switch (configuration) {
      case MyRoutes.first:
        return const RouteInformation(location: '/');
      case MyRoutes.second:
        return const RouteInformation(location: '/second');
      case MyRoutes.third:
        return const RouteInformation(location: '/third');
    }
    // throw 'unknown';
  }
}
