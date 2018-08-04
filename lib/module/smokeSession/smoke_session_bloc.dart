import 'dart:async';

import 'package:app/app/app.dart';
import 'package:app/models/SignalR/signal_r_models.dart';
import 'package:app/models/SmokeSession/smoke_session_meta_data.dart';
import 'package:app/services/signal_r.dart';
import 'package:rxdart/rxdart.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class SmokeSessionBloc {
  Sink get test => _indexController.sink;
  final _indexController = PublishSubject();
  String SessionId;

  final SignalR signalR = new SignalR();

  void testChannel(String msg) {
    signalR.conect();
  }

  static final SmokeSessionBloc _instance = new SmokeSessionBloc._();

  factory SmokeSessionBloc() => SmokeSessionBloc._instance;

  BehaviorSubject<int> smokeState = new BehaviorSubject<int>(seedValue: 0);
  BehaviorSubject<SmokeStatisticDataModel> smokeStatistic =
      new BehaviorSubject<SmokeStatisticDataModel>();

  BehaviorSubject<SmokeSessionMetaData> smokeSessionMetaData =
      new BehaviorSubject<SmokeSessionMetaData>(
          seedValue: new SmokeSessionMetaData());

  Future joinSession(String sessionCode) async {
    if (sessionCode == null) {
      sessionCode = this.SessionId;
    }
    List<String> params = new List<String>();
    params.add(sessionCode);
    this.signalR.callServerFunction(name: 'JoinSession', params: params);

    var sessionData = await App.http.getInitData(sessionCode);

    smokeStatistic.add(sessionData.smokeSessionData);
    smokeSessionMetaData.add(sessionData.metaData);
  }

  SmokeSessionBloc._() {
    _indexController.stream
        // Don't try to update too frequently.
        .bufferTime(Duration(milliseconds: 500))
        // Don't update when there is no need.
        .where((batch) => batch.isNotEmpty)
        .listen(_handleIndexes);

    signalR.clientCalls.listen((onData) {
      proceddCalls(onData);
    });
  }

  proceddCalls(ClientCall onData) {
    if (onData.Data == null) return;

    onData.Data.forEach((f) {
      switch (f.Method) {
        case 'pufChange':
          {
            handlePufChange(f);
            break;
          }
        case 'updateStats':
          {
            handleUpdateStats(f);
            break;
          }
      }
    });
  }

  void _handleIndexes(dynamic indexes) {
    print('click');
  }

  void handlePufChange(ClientMethod f) {
    print(f);
    var data = new PuffChangeDataModel(f.Data);
    smokeState.add(data.state);
  }

  void handleUpdateStats(ClientMethod f) {
    var data = new SmokeStatisticDataModel.fromSignal(f.Data);
    smokeStatistic.add(data);
  }
}

class PuffChangeDataModel extends SignalData {
  int state;
  String stateName;

  PuffChangeDataModel(List<dynamic> data) : super(data) {
    if (data.length > 1) {
      if (data[1] is int) {
        state = data[1];
      }
      if (data[0] is String) {
        {
          stateName = data[0];
        }
      }
    }
  }
}

class SmokeStatisticDataModel extends SignalData {
  int pufCount;
  double lastPuf;
  DateTime lastPufTime;
  Duration smokeDuration;
  DateTime start;
  Duration duration;
  Duration longestPuf;

  SmokeStatisticDataModel() : super(null);

  SmokeStatisticDataModel.fromSignal(List data) : super(data) {
    if (data[0].length < 1) {
      return;
    }
    var map = data[0] as Map;

    pufCount = map['pufCount'];
    final DateFormat df = new DateFormat('dd-MM-yyyy HH:mm:ss');
    lastPuf = double.parse(map['lastPuf']);
    lastPufTime = df.parse(map['lastPufTime']);
    smokeDuration = stringToDuration(map['smokeDuration']);

    start = df.parse(map['start']);

    duration = stringToDuration(map['duration']);

    longestPuf = new Duration(microseconds: map['longestPufMilis'].round());
  }

  SmokeStatisticDataModel.fromJson(Map<String, dynamic> json) : super(null) {}
}

Duration stringToDuration(String sDuration) {
  var chunks = sDuration.split(':');
  var parts = chunks.map((f) {
    if (f.startsWith('0')) {
      return int.parse(f[1]);
    }
    return int.parse(f);
  }).toList();
  return new Duration(hours: parts[0], minutes: parts[1], seconds: parts[2]);
}

abstract class SignalData {
  SignalData(List<dynamic> data);
}
