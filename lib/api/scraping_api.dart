import 'dart:convert';
import 'dart:io';

import 'package:atcoderapp/model/scraping_response.dart';
import 'package:flutter/foundation.dart';

class ScrapingApi {
  final _httpClient = HttpClient();

  Future<ScrapingResponse> scrape() async {
    var response = await _getRequest(_getUri());
    ScrapingResponse list = ScrapingResponse.fromJson(json.decode(response));

    return list;
  }

  Uri _getUri() {
    const String baseUrl = kReleaseMode
        ? 'h0vplcmfah.execute-api.ap-northeast-1.amazonaws.com'
        : '7nbs9rgxmc.execute-api.ap-northeast-1.amazonaws.com';

    const String path = kReleaseMode ? 'prod/scrape' : 'dev/scrape';
    return Uri.https(baseUrl, path);
  }

  Future<String> _getRequest(Uri uri) async {
    var request = await _httpClient.getUrl(uri);
    var response = await request.close();

    return response.transform(utf8.decoder).join();
  }
}

ScrapingApi api = ScrapingApi();
