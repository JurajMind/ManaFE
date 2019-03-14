import 'package:app/models/SignalR/signal_r_models.dart';
import 'package:app/services/signal_r.dart';

class SignalBloc {
  final SignalR _signalR = new SignalR();

  void connect() {
    _signalR.connect().then((value) {
      _signalR.clientCalls.listen((onData) {
        _proceddCalls(onData);
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
