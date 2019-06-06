import 'dart:convert';
import 'package:app/app/app.dart';
import 'package:app/models/SignalR/signal_r_models.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rxdart/rxdart.dart';
import 'dart:async';

import 'package:web_socket_channel/io.dart';

class SignalR {
  static final SignalR _singleton = new SignalR._internal();
  static String host = App.baseUri;
  static String url = 'https://$host/signalr';
  final conectionData = Uri.encodeComponent('[{"name":"smokesessionhub"}]');
  NegotiateResponse connectionInfo;
  String lastMsgId = "";
  DateTime lastPing = DateTime.now();
  BehaviorSubject<DateTime> lastPingStream;
  IOWebSocketChannel _channel;
  Completer<dynamic> _completer;
  Timer connectionTimer;
  Map<String, ServerCallParam> serversCall = Map<String, ServerCallParam>();
  bool connection = false;
  BehaviorSubject<ClientCall> clientCalls = new BehaviorSubject<ClientCall>();
  BehaviorSubject<SignalStatus> connectionStatus =
      new BehaviorSubject<SignalStatus>.seeded(SignalStatus.none);
  factory SignalR() {
    return _singleton;
  }
  SignalR._internal() {
    lastPingStream = new BehaviorSubject<DateTime>.seeded(DateTime.now());
  }

  Future<dynamic> connect({bool force = false}) async {
    if (_completer == null || force) {
      _completer = Completer();
      _connect(force: force);
    }
    return _completer.future;
  }

  Future<dynamic> disconnect() async {
    _channel = null;
    connectionTimer.cancel();
    var abortUrl = url +
        '/abort?transport=webSockets&clientProtocol=${connectionInfo.ProtocolVersion}&connectionToken=${Uri.encodeComponent(connectionInfo.ConnectionToken)}&connectionData=$conectionData';
    var result = await http.get(abortUrl);
    print('signal disconnect ${result.body}');
  }

  Future<dynamic> _connect({bool force = false}) async {
    if (this.connection && !force) {
      return;
    }
    NegotiateResponse negotiateResponse = await getNegotiation();

    var chanelUlr =
        "wss://$host/signalr/connect?transport=webSockets&clientProtocol=${negotiateResponse.ProtocolVersion}&connectionToken=${Uri.encodeComponent(negotiateResponse.ConnectionToken)}&connectionData=$conectionData";

    print(chanelUlr);
    handleConnection(chanelUlr, true);

    await startConnection(negotiateResponse).then((_) {
      _completer.complete();
      connectionStatus.add(SignalStatus.running);
    });
      
  }

  Future<NegotiateResponse> getNegotiation() async {
    var negotiateUrl =
        url + '/negotiate?clientProtocol=1.5&connectionData=$conectionData';
    var response = await http.get(negotiateUrl);
    connection = false;
    final responseJson = json.decode(response.body);
    
    var negotiateResponse = NegotiateResponse.fromJson(responseJson);
    connectionInfo = negotiateResponse;
    return negotiateResponse;
  }

  void handleConnection(String url, bool connection) {
    try {
      _channel = new IOWebSocketChannel.connect(url);
      _channel.stream.listen((message) async {
        print('From signal ' + message);
        if (message == "{}") {
          lastPing = DateTime.now();
          lastPingStream.add(DateTime.now());
        }
        var serverCall = ClientCall.fromJson(json.decode(message));
        proceedCall(serverCall);
      },
      onError: (error){
        print(error);
        if(connection){
          connectionStatus.add(SignalStatus.error);
        }
      });

      new Future.delayed(new Duration(seconds: 5), () {
        for (var call in serversCall.values) {
          callServerFunction(call);
        }
      });
    } catch (e) {
      print(e);
    }
  }

  Future checkConection() async {
    if (lastPing
            .add(new Duration(seconds: connectionInfo.KeepAliveTimeout.toInt()))
            .microsecondsSinceEpoch >
        DateTime.now().microsecondsSinceEpoch) {
      debugPrint('not reconecting');
      return;
    }

    if (lastPing
            .add(
                new Duration(seconds: connectionInfo.DisconnectTimeout.toInt()))
            .microsecondsSinceEpoch >
        DateTime.now().microsecondsSinceEpoch) {
      debugPrint('reconect');
      await restartConnection();
      var reconectCall = new ClientCall(Data: new List<ClientMethod>());
      reconectCall.Data.add(new ClientMethod(Method: "reconect"));
      clientCalls.add(reconectCall);
      return;
    }

    await this.connect(force: true);
    var reconectCall = new ClientCall(Data: new List<ClientMethod>());
    reconectCall.Data.add(new ClientMethod(Method: "new connection"));
    clientCalls.add(reconectCall);
  }

  Future startConnection(NegotiateResponse negotiateResponse) async {
    connection = true;
    var startUrl = url +
        '/start?transport=webSockets&clientProtocol=1.5&connectionToken=${Uri.encodeComponent(negotiateResponse.ConnectionToken)}&connectionData=$conectionData';
    print(startUrl);

    var connect = await http.get(startUrl);

    print('Start connection' + connect.body);
  }

  Future restartConnection() async {
    final conectionData = Uri.encodeComponent(
        '[{"name":"smokesessionhub","messageId":$lastMsgId}]');
    var chanelUlr =
        "wss://$host/signalr/reconnect?transport=webSockets&clientProtocol=${connectionInfo.ProtocolVersion}&connectionToken=${Uri.encodeComponent(connectionInfo.ConnectionToken)}&connectionData=$conectionData";

    print(chanelUlr);

    handleConnection(chanelUlr,false);
  }

  callServerFunction(ServerCallParam param) {
    serversCall[param.name] = param;
    var call = new ServerCall(A: param.params, M: param.name);
    _channel.sink.add(call.toJson());
  }

  void proceedCall(ClientCall serverCall) {
    lastMsgId = serverCall.MessageId;
    if(serverCall.Init == 1){
        connectionStatus.add(SignalStatus.running);
          var oneSec = Duration(seconds: connectionInfo.KeepAliveTimeout.toInt());
       connectionTimer = new Timer.periodic(oneSec, (Timer t) => checkConection());
    }
    if (serverCall.Data != null) clientCalls.add(serverCall);
  }
}

class ServerCallParam {
  ServerCallParam({this.name, this.params});
  String name;
  List<String> params;
}
