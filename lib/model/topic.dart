import 'package:flutter/foundation.dart';

class NotifyTopic {
  final Topic topic;
  bool isChecked;

  NotifyTopic(this.topic, this.isChecked);

  NotifyTopic.fromPref(List<String> prefTopics, Topic topic)
      : topic = topic,
        isChecked = prefTopics.contains(topic.name);

  void toggle() {
    this.isChecked = !this.isChecked;
  }
}

List<NotifyTopic> initializeNotifyTopics() {
  return [
    NotifyTopic(Topic.MORNING, true),
    NotifyTopic(Topic.ONE_HOUR_AGO, true)
  ];
}

enum Topic { MORNING, ONE_HOUR_AGO }

// ignore: missing_return
Topic getTopic(String topicName) {
  switch (topicName) {
    case 'morning':
      return Topic.MORNING;
      break;
    case 'one_hour_ago':
      return Topic.ONE_HOUR_AGO;
      break;
  }
}

extension TopicExt on Topic {
  // ignore: missing_return
  String get name {
    if (kReleaseMode) {
      switch (this) {
        case Topic.MORNING:
          return 'morning';
          break;
        case Topic.ONE_HOUR_AGO:
          return 'one_hour_ago';
          break;
      }
    } else {
      switch (this) {
        case Topic.MORNING:
          return 'dev_morning';
          break;
        case Topic.ONE_HOUR_AGO:
          return 'dev_one_hour_ago';
          break;
      }
    }
  }

  // ignore: missing_return
  String get title {
    switch (this) {
      case Topic.MORNING:
        return '開始当日に通知を受け取る';
        break;
      case Topic.ONE_HOUR_AGO:
        return '開始１時間前に通知を受け取る';
        break;
    }
  }
}

extension TopicsExt on List<NotifyTopic> {
  List<String> get prefTopic {
    return this
        .where((notifyTopic) => notifyTopic.isChecked == true)
        .map((filteredTopic) => filteredTopic.topic.name)
        .toList();
  }
}
