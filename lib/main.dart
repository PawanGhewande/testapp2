import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/navigation/my_route_delegate.dart';
import 'core/navigation/my_route_informtion_parser.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  /// This widget is the root of your application.
  final MyRouterDelegate _delegate = MyRouterDelegate();
  final MyRouteInformationParser _myRouteParser = MyRouteInformationParser();
  var lastLocation;

  @override
  void initState() {
    super.initState();
    // checkLastRoute();
    _delegate.setInitialRoutePath(MyRoutes.values[1]);
    // print('data {$lastLocation}');
    // _myRouteParser.parseRouteInformation(RouteInformation(location: ));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Navigator 2.0',
      routeInformationParser: _myRouteParser,
      routerDelegate: _delegate,
    );
  }

  checkLastRoute() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int index = (prefs.getInt('LastRoute') ?? 0);
    print(index);
    // return index;
    // (Router.of(context).routerDelegate as MyRouterDelegate).configuration =
    //     index as MyRoutes;
    String location = (prefs.getString('location') ?? '/');
    print(location);
    //return location;
  }
}
