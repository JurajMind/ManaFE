import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';

import 'package:web_socket_channel/io.dart';

class SignalR {
  static const String host = "devmana.azurewebsites.net";
  static const String url = 'https://$host/signalr';
  final conectionData = '[{"name":"smokesessionhub"}]';
  NegotiateResponse connectionInfo;

  IOWebSocketChannel _channel;

  bool connection;

  Future<dynamic> conect() async {
    var negotiateUrl =
        url + '/negotiate?clientProtocol=1.5&connectionData=$conectionData';
    var response = await http.get(Uri.encodeFull(negotiateUrl));
    connection = false;
    final responseJson = json.decode(response.body);

    var negotiateResponse = NegotiateResponse.fromJson(responseJson);
    connectionInfo = negotiateResponse;

    var chanelUlr =
        "wss://$host/signalr/connect?transport=webSockets&clientProtocol=1.5&connectionToken=${negotiateResponse.ConnectionToken}==&connectionData=$conectionData";
    chanelUlr = Uri.encodeFull(chanelUlr);
    //chanelUlr = 'wss://echo.websocket.org';
    print(chanelUlr);
    try {
      _channel = new IOWebSocketChannel.connect(chanelUlr);
          _channel.stream.listen((message) async{
        await startConnection(negotiateResponse);
      print('From signal ' + message);
    });
    } catch (e) {
      print(e);
    }

  

  }

  Future startConnection(NegotiateResponse negotiateResponse) async {
    if(this.connection)
    return;
    this.connection = true;
      var startUrl = url +
        '/start?transport=webSockets&clientProtocol=1.5&connectionToken=${negotiateResponse.ConnectionToken}==&connectionData=$conectionData';
    print(startUrl);
    
    var connect = await http.get(Uri.decodeFull(startUrl));
    
    print(connect.body);
  }

  sendMsg(String data) {}

  callServerFunction(String name, List<String> params) {
    var call = new ServerCall(A: params, M: name);
     _channel.sink.add(call.toJson());
  }
}

class NegotiateResponse {
  final String Url;
  final String ConnectionToken;
  final String ConnectionId;
  final double KeepAliveTimeout;
  final double DisconnectTimeout;
  final double ConnectionTimeout;
  final bool TryWebSockets;
  final String ProtocolVersion;
  final double TransportConnectTimeout;
  final double LongPollDelay;

  NegotiateResponse(
      {this.Url,
      this.ConnectionToken,
      this.ConnectionId,
      this.KeepAliveTimeout,
      this.DisconnectTimeout,
      this.ConnectionTimeout,
      this.TryWebSockets,
      this.ProtocolVersion,
      this.TransportConnectTimeout,
      this.LongPollDelay});

  factory NegotiateResponse.fromJson(Map<String, dynamic> json) {
    return NegotiateResponse(
        Url: json['Url'],
        ConnectionToken: json['ConnectionToken'],
        ConnectionId: json['ConnectionId'],
        KeepAliveTimeout: json['KeepAliveTimeout'],
        DisconnectTimeout: json['DisconnectTimeout'],
        ConnectionTimeout: json['ConnectionTimeout'],
        TryWebSockets: json['TryWebSockets'],
        ProtocolVersion: json['ProtocolVersion'],
        TransportConnectTimeout: json['TransportConnectTimeout'],
        LongPollDelay: json['LongPollDelay']);
  }
}

class ServerCall {
  final String H;
  final int I;
  String M;
  List<String> A;

  ServerCall({this.I: 0, this.H = "smokesessionhub", this.A, this.M});

  String toJson() => json.encode(this);
}
