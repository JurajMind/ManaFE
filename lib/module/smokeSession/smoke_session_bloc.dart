import 'dart:async';

import 'package:app/app/app.dart';
import 'package:app/models/SignalR/signal_r_models.dart';
import 'package:app/models/SmokeSession/smoke_session_data.dart';
import 'package:app/models/SmokeSession/smoke_session_meta_data.dart';
import 'package:app/models/Stand/animation.dart';
import 'package:app/services/signal_r.dart';
import 'package:rxdart/rxdart.dart';

class SmokeSessionBloc {
  Sink get test => _indexController.sink;
  final _indexController = PublishSubject();
  String activeSessionId;

  
  final SignalR signalR = new SignalR();

  void testChannel(String msg) {
    signalR.conect();
  }

  static final SmokeSessionBloc _instance = new SmokeSessionBloc._();

  factory SmokeSessionBloc() => SmokeSessionBloc._instance;

  BehaviorSubject<int> smokeState = new BehaviorSubject<int>(seedValue: 0);
  BehaviorSubject<SmokeStatisticDataModel> smokeStatistic =
      new BehaviorSubject<SmokeStatisticDataModel>();

  BehaviorSubject<List<String>> recentSessions =
      new BehaviorSubject<List<String>>(seedValue: new List<String>());

  BehaviorSubject<SmokeSessionMetaData> smokeSessionMetaData =
      new BehaviorSubject<SmokeSessionMetaData>(
          seedValue: new SmokeSessionMetaData());

  BehaviorSubject<List<StandAnimation>> animations=
      new BehaviorSubject<List<StandAnimation>>(seedValue: new List<StandAnimation>());

  Future joinSession(String sessionCode) async {
    if (sessionCode == null) {
      sessionCode = this.activeSessionId;
    }

    if (this.activeSessionId == sessionCode) {
      return;
    } else {
      this.activeSessionId = sessionCode;
    }

    List<String> params = new List<String>();
    params.add(sessionCode);
    this.signalR.callServerFunction(name: 'JoinSession', params: params);
    var list = new List<String>.from(recentSessions.value);
    list.add(sessionCode);
    //recentSessions.add(list);
    var sessionData = await App.http.getInitData(sessionCode);

    smokeStatistic.add(sessionData.smokeSessionData);
    smokeSessionMetaData.add(sessionData.metaData);
    animations.add(await App.http.getAnimations(sessionData.hookah.code));    
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
