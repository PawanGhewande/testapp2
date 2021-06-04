import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'core/data/shared_data.dart';
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
  MyRouterDelegate _delegate = MyRouterDelegate();
  final MyRouteInformationParser _myRouteParser = MyRouteInformationParser();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    isRemembred().then((value) {
      if (value) {
        checkLastRoute()
            .then((value) => _delegate.configuration = MyRoutes.values[value]);
      }
    });

    return MaterialApp.router(
      title: 'Navigator 2.0',
      routeInformationParser: _myRouteParser,
      routerDelegate: _delegate,
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.system,
    );
  }
}
