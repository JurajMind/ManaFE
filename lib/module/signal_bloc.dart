import 'package:app/models/SignalR/signal_r_models.dart';
import 'package:app/services/signal_r.dart';
import 'package:rxdart/rxdart.dart';

class SignalBloc {
  final SignalR _signalR = new SignalR();
  BehaviorSubject<DateTime> lastPingStream;
  void connect() {
    _signalR.connect().then((value) {
      _signalR.clientCalls.listen((onData) {
        _proceddCalls(onData);
        lastPingStream = _signalR.lastPingStream;
      });
    });
  }

  _proceddCalls(ClientCall onData) {
    if (onData.Data == null) return;

    onData.Data.forEach((f) {
      handleCall(f.Method, f.Data);
    });
  }

  handleCall(String method, List<dynamic> data) {}
}
