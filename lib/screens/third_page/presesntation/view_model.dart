import 'dart:async';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:testapp2/screens/third_page/domain/notification.dart';

class NotificationBLoC {
  final _notificationStreamController = StreamController<NotiModel>();

  StreamSink<NotiModel> get notiSink => _notificationStreamController.sink;

  Stream<NotiModel> get notiStram => _notificationStreamController.stream;

  NotificationBLoC() {
    notiStram.listen((event) {
      FlutterLocalNotificationsPlugin flip =
          new FlutterLocalNotificationsPlugin();

      var android = new AndroidInitializationSettings('@mipmap/ic_launcher');
      var IOS = new IOSInitializationSettings();

      var settings = new InitializationSettings(android: android, iOS: IOS);
      flip.initialize(settings);
      _showNotificationWithDefaultSound(flip, event.title, event.content);
    });
  }

  Future _showNotificationWithDefaultSound(
      flip, String title, String content) async {
    final androidPlatformChannelSpecifics = new AndroidNotificationDetails(
        'SimpleID', 'SimleChannel', 'NA',
        importance: Importance.high, priority: Priority.high);
    final iOSPlatformChannelSpecifics = new IOSNotificationDetails();

    // initialise channel platform for both Android and iOS device.
    final platformChannelSpecifics = new NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics);
    await flip.show(0, title, content, platformChannelSpecifics,
        payload: 'Default_Sound');
  }

  dispose() {
    _notificationStreamController.close();
  }
}
