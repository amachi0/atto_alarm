import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

class Contest {
  final String name;
  final String status;
  final DateTime time;
  final String targetRate;

  Contest(this.name, this.status, this.time, this.targetRate);

  Contest.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        status = json['status'],
        time = strToDate(json['time']),
        targetRate = json['target_rate'];

  static DateTime strToDate(String dateStr) {
    return DateTime.parse(dateStr);
  }

  Color statusColor() {
    switch (status) {
      case "予定":
        return Colors.blue;
        break;
      case "終了":
        return Colors.black54;
        break;
      case "開催中":
        return Colors.green;
        break;
      default:
        return Colors.deepPurple[400];
        break;
    }
  }

  String startStr() {
    initializeDateFormatting('ja_JP');
    final formatter = DateFormat('MM/dd(E) HH:mm', "ja_JP");
    return formatter.format(time) + " 開始";
  }

  String targetStr() {
    return "Rated対象： " + targetRate;
  }
}
