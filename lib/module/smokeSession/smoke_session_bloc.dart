import 'dart:async';

import 'package:app/models/SignalR/signal_r_models.dart';
import 'package:app/services/signal_r.dart';
import 'package:rxdart/rxdart.dart';
import 'package:web_socket_channel/io.dart';
import 'package:vibrate/vibrate.dart';

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

  void joinSession(String sessionCode) {
    if (sessionCode == null) {
      sessionCode = this.SessionId;
    }
    List<String> params = new List<String>();
    params.add(sessionCode);
    this.signalR.callServerFunction(name: 'JoinSession', params: params);
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

  void handleUpdateStats(ClientMethod f) {}
}


class PuffChangeDataModel{
  int state;
  String stateName;

  PuffChangeDataModel(List<dynamic> data){
    if(data.length > 1){
      if(data[1] is int)
      {
        state = data[1];
      }
      if(data[0] is String){
        {
          stateName = data[0];
        }
      }
    }
  }
}
