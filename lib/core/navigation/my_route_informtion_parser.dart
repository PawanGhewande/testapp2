import 'package:flutter/material.dart';
import 'package:testapp2/core/data/shared_data.dart';

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
}
