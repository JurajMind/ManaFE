import 'package:alice/alice.dart';
import 'package:app/app/app.dart';
import 'package:app/app/app.widget.dart';
import 'package:app/main.dart';
import 'package:app/models/SignalR/signal_r_models.dart';
import 'package:app/module/data_provider.dart';
import 'package:app/module/module.dart';
import 'package:app/services/authorization.dart';
import 'package:app/services/signal_r.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class TestPage extends StatefulWidget {
  @override
  State<TestPage> createState() => new _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    var service = getIt.get<PersonBloc>();
    var place = getIt.get<PlacesBloc>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Test'),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            StreamBuilder<Position>(
              stream: place.location,
              initialData: null,
              builder: (BuildContext context, snapshot) {
                return Container(
                  child: Text(
                      snapshot.data?.latitude?.toString() ?? 'NO LOCATION'),
                );
              },
            ),
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
              icon: Icon(Icons.directions_boat, color: Colors.greenAccent),
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
                var date = '2019-08-19T15:51:12.9241371Z';
                var a = DateTime.parse(date);
                print(a.toIso8601String());
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
                var auth = getIt.get<AuthorizeRepository>();
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
                var auth = getIt.get<AuthorizeRepository>();
                await auth.messToken();
              },
            ),
            OutlineButton.icon(
              borderSide: BorderSide(color: Colors.white),
              icon: Icon(
                Icons.graphic_eq,
                color: Colors.blue,
              ),
              label: Text('Hard jump'),
              onPressed: () async {
                service.callback(1, TestPage());
              },
            ),
            OutlineButton.icon(
              borderSide: BorderSide(color: Colors.white),
              icon: Icon(
                Icons.restart_alt,
                color: Colors.blue,
              ),
              label: Text('Restart app'),
              onPressed: () async {
                AppWidget.restartApp(context);
              },
            ),
            OutlineButton.icon(
              borderSide: BorderSide(color: Colors.white),
              icon: Icon(
                Icons.restart_alt,
                color: Colors.blue,
              ),
              label: Text('Alice'),
              onPressed: () async {
                getIt.get<Alice>().showInspector();
              },
            ),
            Hero(
              tag: "DemoTag",
              child: IconButton(
                  icon: Icon(Icons.add, size: 70),
                  onPressed: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Placeholder()))),
            ),
          ],
        ),
      ),
    );
  }
}
