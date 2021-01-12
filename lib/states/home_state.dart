import 'package:atcoderapp/api/scraping_api.dart';
import 'package:atcoderapp/model/contest.dart';
import 'package:flutter/material.dart';

class HomeState with ChangeNotifier {
  List<Contest> _contests = List();
  List<Contest> get contests => this._contests;
  set contests(newValue) {
    _contests = newValue;
  }

  bool _error = false;
  bool get error => this._error;
  set error(newValue) {
    _error = newValue;
  }

  bool _loading = true;
  bool get loading => this._loading;
  set loading(newValue) {
    _loading = newValue;
  }

  HomeState() {
    loadContests();
  }

  void loadContests() async {
    ScrapingApi scrapingApi = ScrapingApi();

    loading = true;
    notifyListeners();
    await scrapingApi.scrape().then((response) {
      error = false;
      contests = response.contests;
    }).catchError((onError) {
      error = true;
    }).whenComplete(() {
      loading = false;
      notifyListeners();
    });
  }
}
