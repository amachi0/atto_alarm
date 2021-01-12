import 'package:atcoderapp/model/topic.dart';
import 'package:atcoderapp/states/firebase_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SwitchTileWidget extends StatelessWidget {
  final FirebaseState state;

  SwitchTileWidget(this.state);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: state.topics.length,
        itemBuilder: (BuildContext context, int index) {
          return SwitchListTile(
              title: Text(
                state.topics[index].topic.title,
                style: TextStyle(fontSize: 16),
              ),
              onChanged: (bool value) {
                state.toggleNotifyTopic(index);
              },
              value: state.topics[index].isChecked);
        });
  }
}
