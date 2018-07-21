import 'dart:async';

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

  void joinSession(String sessionCode) {
    if (sessionCode == null) {
      sessionCode = this.SessionId;
    }
    List<String> params = new List<String>();
    params.add(sessionCode);
    this.signalR.callServerFunction(name: 'JoinSession', params: params);
  }
  


  SmokeSessionBloc() {
    _indexController.stream
        // Don't try to update too frequently.
        .bufferTime(Duration(milliseconds: 500))
        // Don't update when there is no need.
        .where((batch) => batch.isNotEmpty)
        .listen(_handleIndexes);
  }

  void _handleIndexes(dynamic indexes) {
    print('click');
  }
}


