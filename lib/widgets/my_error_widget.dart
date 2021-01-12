import 'package:atcoderapp/states/home_state.dart';
import 'package:flutter/material.dart';

class MyErrorWidget extends StatelessWidget {
  final HomeState model;
  MyErrorWidget(this.model);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Icon(Icons.error_outline, color: Colors.red, size: 50),
          SizedBox(height: 10),
          Text('ネットワーク接続を確認してください', style: TextStyle(fontSize: 16)),
          SizedBox(height: 10),
          RaisedButton(
            child: Text('再試行'),
            onPressed: () {
              model.loadContests();
            },
          )
        ],
      ),
    );
  }
}
