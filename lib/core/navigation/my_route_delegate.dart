import 'package:flutter/material.dart';
import 'package:testapp2/core/navigation/my_route_informtion_parser.dart';
import 'package:testapp2/screens/first_page.dart';
import 'package:testapp2/screens/second_page.dart';
import 'package:testapp2/screens/third_page.dart';

class MyRouterDelegate extends RouterDelegate<MyRoutes>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<MyRoutes> {
  @override
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  MyRoutes get configuration => _configuration;
  late MyRoutes _configuration;
  set configuration(MyRoutes value) {
    if (_configuration == value) return;
    _configuration = value;
    notifyListeners();
  }

  @override
  Future<void> setNewRoutePath(MyRoutes configuration) async {
    _configuration = configuration;
  }

  // For web application
  @override
  MyRoutes get currentConfiguration => configuration;

  bool _handlePopPage(Route<dynamic> route, dynamic result) {
    final bool success = route.didPop(result);
    if (success) {
      _configuration = MyRoutes.first;
      notifyListeners();
    }
    return success;
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: <Page<void>>[
        MaterialPage(key: ValueKey('first'), child: FirstPage()),
        if (configuration == MyRoutes.second)
          MaterialPage(key: ValueKey('second'), child: SecondPage()),
        if (configuration == MyRoutes.third)
          MaterialPage(key: ValueKey('third'), child: ThirdPage()),
      ],
      onPopPage: _handlePopPage,
    );
  }
}
