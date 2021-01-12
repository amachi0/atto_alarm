import 'package:atcoderapp/model/topic.dart';
import 'package:atcoderapp/util/firebase_notifications.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FirebaseState with ChangeNotifier {
  String TOPICS_KEY = "topics";

  FirebaseNotifications firebaseNotifications;

  List<NotifyTopic> _topics = List();
  List<NotifyTopic> get topics => this._topics;

  bool _loading = true;
  bool get loading => this._loading;

  FirebaseState() {
    firebaseNotifications = FirebaseNotifications();
    firebaseNotifications.setUp();
    getNotifyState();
  }

  void getNotifyState() async {
    _loading = true;
    notifyListeners();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var topicPref = prefs.getStringList(TOPICS_KEY);
    if (topicPref == null) {
      List<NotifyTopic> initialNotifyTopics = initializeNotifyTopics();
      await prefs.setStringList(TOPICS_KEY, initialNotifyTopics.prefTopic);

      initialNotifyTopics.forEach((notifyTopic) {
        firebaseNotifications.subscribeToTopic(notifyTopic.topic);
      });
      _topics = initialNotifyTopics;
    } else {
      _topics = Topic.values
          .map((topic) => NotifyTopic.fromPref(topicPref, topic))
          .toList();
    }
    _loading = false;
    notifyListeners();
  }

  toggleNotifyTopic(int index) async {
    _topics[index].toggle();
    if (_topics[index].isChecked) {
      firebaseNotifications.subscribeToTopic(_topics[index].topic);
    } else {
      firebaseNotifications.unsubscribeFromTopic(_topics[index].topic);
    }
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(TOPICS_KEY, _topics.prefTopic);
    notifyListeners();
  }
}
