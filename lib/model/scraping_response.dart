import 'package:atcoderapp/model/contest.dart';

class ScrapingResponse {
  final List<Contest> contests;

  ScrapingResponse.fromJson(Map<String, dynamic> json)
      : contests = (json['response'] as List)
            .map((json) => Contest.fromJson(json))
            .toList();
}
