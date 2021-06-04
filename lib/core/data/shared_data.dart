import 'package:shared_preferences/shared_preferences.dart';

Future<int> checkLastRoute() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  int index = (prefs.getInt('LastRoute') ?? 0);
  return index;
}

Future<bool> isRemembred() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isRemembred = (prefs.getBool('isRemember') ?? false);
  return isRemembred;
}

void setRemember(bool status) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setBool('isRemember', status);
}

void setLastRoute(int visitedRoute, String location) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  print('Called Method to record last route. $location');
  await prefs.setString('location', location);
  await prefs.setInt('LastRoute', visitedRoute);
}

// Future<bool> isRemembred() async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   bool isRemembred = (prefs.getBool('isRemember') ?? false);
//   return isRemembred;
// }
