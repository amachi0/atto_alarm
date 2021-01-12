import 'package:admob_flutter/admob_flutter.dart';
import 'package:atcoderapp/pages/settings.dart';
import 'package:atcoderapp/states/firebase_state.dart';
import 'package:atcoderapp/states/home_state.dart';
import 'package:atcoderapp/util/admob.dart';
import 'package:atcoderapp/widgets/contest_wedget.dart';
import 'package:atcoderapp/widgets/my_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Provider.of<FirebaseState>(context, listen: false);
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'コンテスト一覧',
            style: TextStyle(fontSize: 18),
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                _goToSettingPage(context);
              },
            )
          ],
        ),
        body: ChangeNotifierProvider<HomeState>(
          create: (context) => HomeState(),
          child: Consumer<HomeState>(builder: (_, model, __) {
            if (model.error && !model.loading) {
              return MyErrorWidget(model);
            }
            if (model.loading) {
              return Center(
                child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                        Theme.of(context).primaryColor)),
              );
            } else {
              return ContestWidget(model);
            }
          }),
        ),
        bottomNavigationBar: AdmobBanner(
            adUnitId: AdMobService().getBannerAdUnitId(),
            adSize: AdmobBannerSize(
              width: MediaQuery.of(context).size.width.toInt(),
              height: AdMobService().getHeight(context).toInt(),
              name: 'SMART_BANNER',
            )));
  }

  void _goToSettingPage(BuildContext context) {
    Navigator.of(context).push(PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => SettingsPage(),
    ));
  }
}
