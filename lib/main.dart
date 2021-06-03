import 'package:flutter/material.dart';

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
  // This widget is the root of your application.
  MyRouterDelegate _delegate = MyRouterDelegate();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      routeInformationParser: MyRouteInformationParser(),
      routerDelegate: _delegate,
    );
  }
}
