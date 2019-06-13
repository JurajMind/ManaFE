import 'package:app/app/app.dart';
import 'package:app/models/SignalR/signal_r_models.dart';
import 'package:app/module/data_provider.dart';
import 'package:app/pages/Statistic/hero_test_page.dart';
import 'package:app/services/authorization.dart';
import 'package:app/services/signal_r.dart';
import 'package:flutter/material.dart';

class TestPage extends StatefulWidget {
  @override
  State<TestPage> createState() => new _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    var service = DataProvider.getData(context).personBloc;

    return Scaffold(
      appBar: AppBar(
        title: Text('Test'),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            StreamBuilder<DateTime>(
              stream: service.lastPingStream,
              initialData: DateTime.now(),
              builder: (BuildContext context, snapshot) {
                return Container(
                  child: Text(snapshot.data.toString()),
                );
              },
            ),
                        StreamBuilder<SignalStatus>(
              stream: service.connectionStatus,
              initialData: SignalStatus.none,
              builder: (BuildContext context, snapshot) {
                return Container(
                  child: Text(snapshot.data.toString()),
                );
              },
            ),
            OutlineButton.icon(
              borderSide: BorderSide(color: Colors.white),
              icon: Icon(
                Icons.cloud,
                color: Colors.red,
              ),
              label: Text('Signal reconect'),
              onPressed: () async {
                var signal = new SignalR();
                signal.restartConnection();
              },
            ),
            OutlineButton.icon(
              borderSide: BorderSide(color: Colors.white),
              icon: Icon(
                Icons.cloud_off,
                color: Colors.red,
              ),
              label: Text('Signal restart connection'),
              onPressed: () async {
                var signal = new SignalR();
                await signal.disconnect();
                await signal.connect(force: true);
              },
            ),
            OutlineButton.icon(
              borderSide: BorderSide(color: Colors.white),
              icon: Icon(
                Icons.directions_boat,
                color: Colors.greenAccent
              ),
              label: Text('Signal disconect'),
              onPressed: () async {
                var signal = new SignalR();
                await signal.disconnect();
              },
            ),
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
