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
  IOWebSocketChannel _channel;
  Completer<dynamic> _completer;
  Timer connectionTimer;
  bool connection = false;

  factory SignalR() {
    return _singleton;
  }
  SignalR._internal();

  Future<dynamic> connect() async {
    if (_completer == null) {
      _completer = Completer();
      _connect();
    }
    return _completer.future;
  }

  Future<dynamic> _connect() async {
    if (this.connection) {
      return;
    }
    var negotiateUrl =
        url + '/negotiate?clientProtocol=1.5&connectionData=$conectionData';
    var response = await http.get(negotiateUrl);
    connection = false;
    final responseJson = json.decode(response.body);

    var negotiateResponse = NegotiateResponse.fromJson(responseJson);
    connectionInfo = negotiateResponse;

    var chanelUlr =
        "wss://$host/signalr/connect?transport=webSockets&clientProtocol=${negotiateResponse.ProtocolVersion}&connectionToken=${Uri.encodeComponent(negotiateResponse.ConnectionToken)}&connectionData=$conectionData";

    print(chanelUlr);
    const oneSec = const Duration(seconds: 20);
    connectionTimer = new Timer.periodic(oneSec, (Timer t) => checkConection());
    try {
      _channel = new IOWebSocketChannel.connect(chanelUlr);
      _channel.stream.listen((message) async {
        print('From signal ' + message);
        if (message == "{}") {
          // ping msg
          lastPing = DateTime.now();
        }
        var serverCall = ClientCall.fromJson(json.decode(message));
        proceedCall(serverCall);
      });
    } catch (e) {
      print(e);
    }

    await startConnection(negotiateResponse);
  }

  Future checkConection() async {
    if (lastPing.add(new Duration(seconds: 30)).microsecondsSinceEpoch >
        DateTime.now().microsecondsSinceEpoch) {
      debugPrint('not reconecting');
      return;
    }

    await restartConnection();
    var reconectCall = new ClientCall(Data: new List<ClientMethod>());
    reconectCall.Data.add(new ClientMethod(Method: "reconect"));
    clientCalls.add(reconectCall);
  }

  Future startConnection(NegotiateResponse negotiateResponse) async {
    if (connection) return;
    connection = true;
    var startUrl = url +
        '/start?transport=webSockets&clientProtocol=1.5&connectionToken=${Uri.encodeComponent(negotiateResponse.ConnectionToken)}&connectionData=$conectionData';
    print(startUrl);

    var connect = await http.get(startUrl);

    print(connect.body);
  }

  Future restartConnection() async {
    final conectionData = Uri.encodeComponent(
        '[{"name":"smokesessionhub","messageId":$lastMsgId}]');
    var chanelUlr =
        "wss://$host/signalr/reconnect?transport=webSockets&clientProtocol=${connectionInfo.ProtocolVersion}&connectionToken=${Uri.encodeComponent(connectionInfo.ConnectionToken)}&connectionData=$conectionData";

    print(chanelUlr);

    try {
      _channel = new IOWebSocketChannel.connect(chanelUlr);
      _channel.stream.listen((message) async {
        print('From signal reconected ' + message);
        if (message == "{}") {
          // ping msg
          lastPing = DateTime.now();
          print('PingTime ' + lastPing.toString());
        }
        var serverCall = ClientCall.fromJson(json.decode(message));
        proceedCall(serverCall);
      });
    } catch (e) {
      print(e);
    }
  }

  BehaviorSubject<ClientCall> clientCalls = new BehaviorSubject<ClientCall>();

  sendMsg(String data) {}

  callServerFunction({String name, List<String> params}) {
    var call = new ServerCall(A: params, M: name);
    _channel.sink.add(call.toJson());
  }

  void proceedCall(ClientCall serverCall) {
    lastMsgId = serverCall.MessageId;
    if (serverCall.Data != null) clientCalls.add(serverCall);
  }
}
