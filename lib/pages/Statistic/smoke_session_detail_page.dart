import 'package:app/Helpers/date_utils.dart';
import 'package:flutter/material.dart';
import 'package:openapi/api.dart';

class SmokeSessioDetailPage extends StatefulWidget {
  final SmokeSessionSimpleDto session;
  SmokeSessioDetailPage(this.session, {Key key}) : super(key: key);

  _SmokeSessioDetailPageState createState() => _SmokeSessioDetailPageState();
}

class _SmokeSessioDetailPageState extends State<SmokeSessioDetailPage> {
  DateTime start;

  @override
  initState() {
    super.initState();
    start =
        new DateTime.fromMillisecondsSinceEpoch(widget.session.statistic.start);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          actions: <Widget>[],
          title: Text(
              "${DateUtils.toStringDate(start)} - ${DateUtils.toStringShortTime(start)}")),
      body: ListView(
        children: <Widget>[Text('test')],
      ),
    );
  }
}
