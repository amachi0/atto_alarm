import 'package:atcoderapp/states/firebase_state.dart';
import 'package:atcoderapp/widgets/switch_tile_wedget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('通知設定', style: TextStyle(fontSize: 18)),
        ),
        body: SettingsBody());
  }
}

class SettingsBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firebaseState = Provider.of<FirebaseState>(context);
    if (firebaseState.loading) {
      return Center(
        child: CircularProgressIndicator(
            valueColor:
                AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor)),
      );
    } else {
      return SwitchTileWidget(firebaseState);
    }
  }
}
