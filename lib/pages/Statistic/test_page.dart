import 'package:app/app/app.dart';
import 'package:app/pages/Statistic/hero_test_page.dart';
import 'package:app/services/authorization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class TestPage extends StatefulWidget {
  @override
  State<TestPage> createState() => new _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Test'),
        backgroundColor: Colors.black,
      ),
      body: Center(
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
            OutlineButton.icon(
              borderSide: BorderSide(color: Colors.white),
              icon: Icon(
                Icons.notifications,
                color: Colors.red,
              ),
              label: Text('Test notification'),
              onPressed: () async {
                App.http.testNotification();
              },
            ),
            OutlineButton.icon(
              borderSide: BorderSide(color: Colors.white),
              icon: Icon(
                Icons.delete_sweep,
                color: Colors.red,
              ),
              label: Text('Corupt tokken'),
              onPressed: () async {
                var auth = new Authorize();
                await auth.messToken();
              },
            ),
            Hero(
              tag: "DemoTag",
              child: IconButton(
                icon: Icon(Icons.add, size: 70),
                onPressed: () => Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Hero2())),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
