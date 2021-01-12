import 'dart:io';

import 'package:atcoderapp/model/topic.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseNotifications {
  FirebaseMessaging _firebaseMessaging;

  void setUp() {
    _firebaseMessaging = FirebaseMessaging();
    firebaseCloudMessagingListeners();
  }

  void subscribeToTopic(Topic topic) {
    _firebaseMessaging.subscribeToTopic(topic.name);
  }

  void unsubscribeFromTopic(Topic topic) {
    _firebaseMessaging.unsubscribeFromTopic(topic.name);
  }

  void firebaseCloudMessagingListeners() {
    if (Platform.isIOS) iOSPermission();

    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print('on message $message');
      },
      onResume: (Map<String, dynamic> message) async {
        print('on resume $message');
      },
      onBackgroundMessage: myBackgroundMessageHandler,
      onLaunch: (Map<String, dynamic> message) async {
        print('on launch $message');
      },
    );
  }

  void iOSPermission() {
    _firebaseMessaging.requestNotificationPermissions(
        IosNotificationSettings(sound: true, badge: true, alert: true));
    _firebaseMessaging.onIosSettingsRegistered
        .listen((IosNotificationSettings settings) {
      print("Settings registered: $settings");
    });
  }
}

// ignore: missing_return
Future<dynamic> myBackgroundMessageHandler(Map<String, dynamic> message) {
  print("background: $message");
  if (message.containsKey('data')) {
// Handle data message
    final dynamic data = message['data'];
    print(data);
  }

  if (message.containsKey('notification')) {
// Handle notification message
    final dynamic notification = message['notification'];
    print(notification);
  }
}
