import 'package:atcoderapp/states/home_state.dart';
import 'package:flutter/material.dart';

class ContestWidget extends StatelessWidget {
  final HomeState model;
  ContestWidget(this.model);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: model.contests.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.only(top: 6, left: 10, bottom: 0, right: 10),
            child: Card(
              elevation: 2,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              child: Column(children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        _chipState(index),
                        _startTime(index),
                        _targetRate(index)
                      ]),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(20, 7, 20, 10),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      child: Text(
                        model.contests[index].name,
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                )
              ]),
            ),
          );
        });
  }

  Widget _chipState(int index) {
    final contest = model.contests[index];
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 13),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13),
          color: contest.statusColor()),
      child: Text(contest.status,
          style: TextStyle(color: Colors.white, fontSize: 14)),
    );
  }

  Widget _startTime(int index) {
    final contest = model.contests[index];
    return Container(
      margin: EdgeInsets.only(left: 10),
      child: Text(
        contest.startStr(),
        style: TextStyle(fontSize: 13),
      ),
    );
  }

  Widget _targetRate(int index) {
    final contest = model.contests[index];
    return Expanded(
        child: Container(
            margin: EdgeInsets.only(left: 8),
            child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  contest.targetStr(),
                  style: TextStyle(fontSize: 13),
                ))));
  }
}
