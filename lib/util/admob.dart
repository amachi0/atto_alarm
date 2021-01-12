import 'dart:io';

import 'package:flutter/material.dart';

class AdMobService {
  String getBannerAdUnitId() {
    if (Platform.isAndroid) {
      return 'ca-app-pub-7938321522188763/9517094880';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-7938321522188763/2835479921';
    }
    return null;
  }

  double getHeight(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final percent = (height * 0.06).toDouble();

    return percent;
  }
}
