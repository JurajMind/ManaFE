import 'package:app/app/app.dart';
import 'package:app/services/authorization.dart';
import 'package:flutter/material.dart';

class TestPage extends StatefulWidget {
  @override
  State<TestPage> createState() => new _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Column(
        children: <Widget>[
          AppBar(
            title: Text('Test'),
            backgroundColor: Colors.black,
          ),
          Expanded(
            child: Center(
              child: Column(
                children: <Widget>[
                  OutlineButton.icon(
                    borderSide: BorderSide(color: Colors.white),
                    icon: Icon(
                      Icons.delete_sweep,
                      color: Colors.red,
                    ),
                    label: Text('Test date format'),
                    onPressed: () async {
                      var date = '2019-03-04T22:20:49.595651Z';
                      var a = DateTime.parse(date);
                    },
                  ),
                  OutlineButton.icon(
                    borderSide: BorderSide(color: Colors.white),
                    icon: Icon(
                      Icons.delete_sweep,
                      color: Colors.red,
                    ),
                    label: Text('Test token recovery'),
                    onPressed: () async {
                      var auth = new Authorize();
                      auth.messToken();

                      var request = App.http
                          .getPersonInitData()
                          .then((v) => debugPrint('refreshed'));
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
